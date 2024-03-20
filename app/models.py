import os
import secrets
from sqlalchemy import UniqueConstraint, event
from flask import current_app, url_for
from app import db, bcrypt
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_login import UserMixin
from flask_bcrypt import check_password_hash

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


like = db.Table('like',
    db.Column('user_id', db.Integer, db.ForeignKey('users1.id')),
    db.Column('recipient_id', db.Integer, db.ForeignKey('users1.id')),
    db.UniqueConstraint('user_id', 'recipient_id', name='unique_like_constraint')
)


class UserGroup(db.Model):
    __tablename__ = 'user_group'

    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), primary_key=True)
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'), primary_key=True)

    group = db.relationship('GroupModel', back_populates='user_groups')
    user = db.relationship('User', back_populates="user_groups")


class GroupModel(db.Model):
    __tablename__ = 'groups'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    join_code = db.Column(db.String(20), unique=True, nullable=False)

    user_groups = db.relationship('UserGroup', back_populates='group')
    author = db.relationship('User', back_populates='authored_groups', foreign_keys=[author_id])
    members = db.relationship('User', secondary='user_group', back_populates='groups')

    posts = db.relationship('Article', back_populates='group')

    def __init__(self, name, author_id):
        self.name = name
        self.author_id = author_id
        self.join_code = self.generate_join_code()

    # генерация случайной ссылки для входа
    def generate_join_code(self):
        return secrets.token_urlsafe(6)


class User(UserMixin, db.Model):
    __tablename__ = 'users1'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    login = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(60), nullable=False, unique=True)
    file = db.Column(db.String(255))
    description = db.Column(db.String(255))
    comments = db.Column(db.Text)
    recipient_id = db.Column(db.Integer, db.ForeignKey('users1.id'))
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'))
    user_articles = db.relationship("Article", back_populates="author")
    user_comments = db.relationship("Comment", back_populates="author")
    user_groups = db.relationship('UserGroup', back_populates='user', foreign_keys=[UserGroup.user_id])
    groups = db.relationship('GroupModel', secondary='user_group', back_populates='members')
    authored_groups = db.relationship('GroupModel', back_populates='author', foreign_keys='GroupModel.author_id')

    # Новые отношения для лайков
    liked_users = db.relationship('User', secondary='like',
                                  primaryjoin='User.id == like.c.user_id',
                                  secondaryjoin='User.id == like.c.recipient_id',
                                  back_populates='likes_received',
                                  lazy='dynamic')

    likes_received = db.relationship('User', secondary='like',
                                     primaryjoin='User.id == like.c.recipient_id',
                                     secondaryjoin='User.id == like.c.user_id',
                                     back_populates='liked_users',
                                     lazy='dynamic')

    __table_args__ = (
        UniqueConstraint('id', 'recipient_id', name='unique_like_constraint'),
    )

    def __init__(self, login, password, email, file='default-avatar.png', description=''):
        self.login = login
        self.set_password(password)
        self.email = email
        self.description = description
        self.file = file
        self.comments = "[]"

    def save_file(self, file):
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER_AVATARS'], filename)
            file.save(file_path)
            return filename
        return None

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def is_authenticated(self):
        return True

    def set_password(self, password):
        self.password = bcrypt.generate_password_hash(password).decode('utf-8')

    def check_password(self, password):
        return check_password_hash(self.password, password)

    def profile_url(self):
        return url_for('main.profile_by_id', user_id=self.id)

    def get_avatar_url(self):
        if self.file:
            return url_for('static', filename=f'avatars/{self.file}')
        else:
            return url_for('static', filename='avatars/default-avatar.png')

    def set_avatar_url(self, value):
        pass

    def avatar_url(self):
        return url_for('static', filename=f'avatars/{self.file}') if self.file else url_for('static', filename='avatars/default-avatar.png')

    def add_comment(self, comment_text, article_id):
        comment = Comment(text=comment_text, user_id=self.id, article_id=article_id)
        db.session.add(comment)
        db.session.commit()

    def get_comments(self):
        import json
        return json.loads(self.comments)

    def has_liked_user(self, user_id):
        return self.liked_users.filter_by(id=user_id).first() is not None

    def get_id(self):
        return f"{self.id}{str(self.group_id) if self.group_id is not None else ''}"


class Comment(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), nullable=False)
    author = db.relationship('User', back_populates='user_comments', foreign_keys=[user_id])

    def avatar_url(self):
        return self.author.avatar_url() if self.author else None

    def __repr__(self):
        return f'<Comment {self.id}>'


class Article(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    intro = db.Column(db.String(300), nullable=False)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    file = db.Column(db.String(1000))
    hidden = db.Column(db.Boolean, default=False)
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'))  # Здесь изменено на Integer

    comments = db.relationship("Comment", cascade="all, delete-orphan", backref="article")
    author = db.relationship('User', back_populates='user_articles', foreign_keys=[user_id])
    group = db.relationship('GroupModel', back_populates='posts')

    def __init__(self, title, intro, text, user_id, file=None, group_id=None):
        self.title = title
        self.intro = intro
        self.text = text
        self.user_id = user_id
        self.file = file
        self.group_id = group_id

    def update_group_relationship(target, value, oldvalue, initiator):
        if target.group_id is not None:
            # Получаем группу, связанную с текущей статьей
            group = GroupModel.query.get(target.group_id)
            if group:
                # Если группа существует, добавляем текущую статью в список постов этой группы
                if target not in group.posts:
                    group.posts.append(target)
                    db.session.commit()

    def author_name(self):
        user = User.query.get(self.user_id)
        return user.login if user else 'Unknown'

    def author_avatar_url(self):
        return url_for('static', filename=f'avatars/{self.author.file}') if self.author.file else url_for('static',
                                                                                                          filename='avatars/default-avatar.png')

    def __repr__(self):
        return f'<Article {self.id}>'




