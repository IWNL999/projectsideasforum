from app import db, bcrypt
from flask import Flask
from datetime import datetime
from flask_login import UserMixin
from flask_bcrypt import check_password_hash
from sqlalchemy.exc import OperationalError


class User(UserMixin, db.Model):
    __tablename__ = 'users1'
    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(60), nullable=False, unique=True)
    file = db.Column(db.String(255))

    def __init__(self, login, password, email, file):
        self.login = login
        self.set_password(password)
        self.email = email
        self.file = file

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
