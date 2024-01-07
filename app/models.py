import os
from flask import current_app, render_template, flash, redirect, url_for, request
from werkzeug.datastructures import FileStorage
from app import db, bcrypt
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_login import UserMixin, login_required, current_user
from flask_bcrypt import check_password_hash

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


class User(UserMixin, db.Model):
    __tablename__ = 'users1'
    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(60), nullable=False, unique=True)
    file = db.Column(db.String(255))
    description = db.Column(db.String(255))

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

    def save_file(self, file):
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)  # Добавим 'avatars' к пути

            file.save(file_path)
            return filename  # Возвращаем только имя файла
        return Non

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
        # Можете добавить логику установки значения, если необходимо
        pass

    def avatar_url(self):
        return url_for('static', filename=f'avatars/{self.file}') if self.file else url_for('static',
                                                                                            filename='avatars/default'
                                                                                                     '-avatar.png')


class Article(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    intro = db.Column(db.String(300), nullable=False)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users1.id'), nullable=False)
    author = db.relationship('User', backref='user_articles', lazy=True)

    def __repr__(self):
        return '<Article %r>' % self.id
