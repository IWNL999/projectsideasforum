import os
from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey
from flask import current_app, url_for
from sqlalchemy.orm import relationship
from werkzeug.datastructures import FileStorage
from app import db, bcrypt
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_login import UserMixin
from flask_bcrypt import check_password_hash

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


class User(UserMixin, db.Model):
    __tablename__ = 'users1'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    login = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(60), nullable=False, unique=True)
    file = db.Column(db.String(255))
    description = db.Column(db.String(255))
    user_articles = db.relationship("Article", back_populates="author")  # Используем 'user_articles' вместо 'posts'
    comments = db.Column(db.Text)

    def __init__(self, login, password, email, file='default-avatar.png', description=''):
        self.login = login
        self.set_password(password)
        self.email = email
        self.description = description
        if file and file != 'default-avatar.png':
            if isinstance(file, FileStorage):
                self.file = self.save_file(file)
            else:
                self.file = file
        else:
            self.file = None
        self.comments = "[]"  # Начальное значение списка комментариев

    def save_file(self, file):
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
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
        return url_for('static', filename=f'avatars/{self.file}')

    def set_avatar_url(self, value):
        pass

    def avatar_url(self):
        return url_for('static', filename=f'avatars/{self.file}') if self.file else url_for('static',
                                                                                            filename='avatars/default'
                                                                                                     '-avatar.png')

    def add_comment(self, comment_text, article_id):
        comment = Comment(text=comment_text, user_id=self.id, article_id=article_id)
        db.session.add(comment)
        db.session.commit()

    def get_comments(self):
        import json
        return json.loads(self.comments)


class Comment(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), nullable=False)

    def __repr__(self):
        return f'<Comment {self.id}>'


class Article(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    intro = db.Column(db.String(300), nullable=False)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    author = db.relationship('User', back_populates='user_articles', foreign_keys=[user_id])

    def author_name(self):
        user = User.query.get(self.user_id)
        return user.login if user else 'Unknown'

    def author_avatar_url(self):
        return url_for('static', filename=f'avatars/{self.author.file}') if self.author.file else url_for('static',
                                                                                                          filename='avatars/default-avatar.png')

    def __repr__(self):
        return f'<Article {self.id}>'
