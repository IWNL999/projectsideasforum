import os
import secrets
from sqlalchemy import UniqueConstraint, event
from sqlalchemy.dialects.postgresql import JSON
from flask import current_app, url_for
from app import db, bcrypt
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_login import UserMixin
from flask_bcrypt import check_password_hash

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


like = db.Table(
    'like',
    db.Column('user_id', db.Integer, db.ForeignKey('users1.id'), primary_key=True),
    db.Column('recipient_id', db.Integer, db.ForeignKey('users1.id'), primary_key=True),
    db.UniqueConstraint('user_id', 'recipient_id', name='unique_like_constraint')
)

article_group_association = db.Table(
    'article_group_association',
    db.Column('article_id', db.Integer, db.ForeignKey('article.id'), primary_key=True),
    db.Column('group_id', db.Integer, db.ForeignKey('groups.id'), primary_key=True)
)


class UserGroup(db.Model):
    __tablename__ = 'user_group'
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), primary_key=True)
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'), primary_key=True)
    group = db.relationship('GroupModel', back_populates='user_groups')
    user = db.relationship('User', back_populates="user_groups")


class ArticleGroupAssociation(db.Model):
    __tablename__ = 'article_group_association'
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), primary_key=True)
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'), primary_key=True)
    article = db.relationship('Article', back_populates='group_associations', foreign_keys=[article_id])
    group = db.relationship('GroupModel', back_populates='article_associations')

    __table_args__ = {'extend_existing': True}


class GroupModel(db.Model):
    __tablename__ = 'groups'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    join_code = db.Column(db.String(20), unique=True, nullable=False)
    posts = db.relationship('Article',
                            secondary='article_group_association',
                            backref=db.backref('groups', lazy='dynamic'),
                            lazy='dynamic',
                            overlaps="article")
    user_groups = db.relationship('UserGroup', back_populates='group')
    author = db.relationship('User', back_populates='authored_groups', foreign_keys=[author_id])
    members = db.relationship('User', secondary='user_group', back_populates='groups')
    article_associations = db.relationship('ArticleGroupAssociation', back_populates='group')

    def __init__(self, name, author_id):
        self.name = name
        self.author_id = author_id
        self.join_code = self.generate_join_code()

    def generate_join_code(self):
        return secrets.token_urlsafe(6)


class User(UserMixin, db.Model):
    __tablename__ = 'users1'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    login = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(60), nullable=False, unique=True)
    file = db.Column(db.String(255))
    description = db.Column(db.String(255))
    comments = db.Column(db.Text)
    recipient_id = db.Column(db.Integer, db.ForeignKey('users1.id'))
    group_id = db.Column(db.Integer, db.ForeignKey('groups.id'))
    is_admin = db.Column(db.Boolean, default=False)
    is_moderator = db.Column(db.Boolean, default=False)
    is_banned = db.Column(db.Boolean, default=False)

    banned_users = db.relationship('BannedUser', back_populates='user', uselist=False)
    user_articles = db.relationship("Article", back_populates="author")
    user_comments = db.relationship("Comment", back_populates="author")
    user_groups = db.relationship('UserGroup', back_populates='user', foreign_keys=[UserGroup.user_id])
    groups = db.relationship('GroupModel', secondary='user_group', back_populates='members')
    authored_groups = db.relationship('GroupModel', back_populates='author', foreign_keys='GroupModel.author_id')
    moderator_role = db.relationship('Moderator', back_populates='user')
    admin = db.relationship('Admin', back_populates='user')
    bookmarks = db.relationship('Bookmark', back_populates='user')

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
        self.is_moderator = False
        self.is_admin = False

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
        return str(self.id)


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
    __tablename__ = 'article'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    intro = db.Column(db.String(300), nullable=False)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    file = db.Column(db.String(1000))
    hidden = db.Column(db.Boolean, default=False)

    comments = db.relationship("Comment", cascade="all, delete-orphan", backref="article")
    author = db.relationship('User', back_populates='user_articles', foreign_keys=[user_id])
    group_associations = db.relationship('ArticleGroupAssociation', back_populates='article')
    bookmarks = db.relationship('Bookmark', back_populates='article')

    def __init__(self, title, intro, text, user_id, file=None):
        self.title = title
        self.intro = intro
        self.text = text
        self.user_id = user_id
        self.file = file

    @staticmethod
    def update_group_relationship(target, value, oldvalue, initiator):
        if value is not None:
            group = GroupModel.query.get(value)
            if group:
                if target not in group.posts:
                    group.posts.append(target)
                    db.session.commit()

    def author_name(self):
        user = User.query.get(self.user_id)
        return user.login if user else 'Unknown'

    def author_avatar_url(self):
        return url_for('static', filename=f'avatars/{self.author.file}') if self.author.file else url_for('static', filename='avatars/default-avatar.png')

    def can_edit(self, user):
        """Проверка прав на редактирование поста."""
        return user.is_authenticated and (user.is_admin or user.is_moderator or self.author_id == user.id)

    def can_delete(self, user):
        """Проверка прав на удаление поста."""
        return user.is_authenticated and (user.is_admin or user.is_moderator or self.author_id == user.id)

    def edit(self, title, intro, text):
        """Метод для редактирования поста."""
        self.title = title
        self.intro = intro
        self.text = text
        db.session.commit()

    def delete(self):
        """Метод для удаления поста."""
        db.session.delete(self)
        db.session.commit()

    def __repr__(self):
        return f'<Article {self.id}>'


event.listen(Article.group_associations, 'set', Article.update_group_relationship)


class Admin(db.Model):
    __tablename__ = 'admins'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), unique=True, nullable=False)

    user = db.relationship('User', back_populates='admin')

    def __init__(self, user_id):
        self.user_id = user_id
        user = User.query.get(user_id)
        user.is_admin = True
        db.session.commit()


class Moderator(db.Model):
    __tablename__ = 'moderators'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), unique=True, nullable=False)

    user = db.relationship('User', back_populates='moderator_role')

    def __init__(self, user_id):
        self.user_id = user_id


class BannedUser(db.Model):
    __tablename__ = 'banned_users'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), unique=True, nullable=False)
    reason = db.Column(db.String(255), nullable=False)
    banned_at = db.Column(db.DateTime, default=datetime.utcnow)
    user = db.relationship('User', back_populates='banned_users')

    def __init__(self, user_id, reason):
        self.user_id = user_id
        self.reason = reason


class Bookmark(db.Model):
    __tablename__ = 'bookmark'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), nullable=False)

    user = db.relationship('User', back_populates='bookmarks')
    article = db.relationship('Article', back_populates='bookmarks')

    __table_args__ = (
        db.UniqueConstraint('user_id', 'article_id', name='unique_bookmark_constraint'),
    )


class UserSession(db.Model):
    __tablename__ = 'sessions'
    id = db.Column(db.Integer, primary_key=True)
    session_id = db.Column(db.String(255), nullable=False, unique=True)
    data = db.Column(JSON, nullable=False)
    expiry = db.Column(db.DateTime, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)