from flask_bcrypt import Bcrypt
from flask_session import Session
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
import os

db = SQLAlchemy()
bcrypt = Bcrypt()
login_manager = LoginManager()
login_manager.login_view = 'main.login'


def create_app():
    app = Flask(__name__)
    app.config['SESSION_TYPE'] = 'sqlalchemy'
    app.config['SESSION_SQLALCHEMY'] = db.engine  # Используем db.engine для получения экземпляра SQLAlchemy
    app.config['SESSION_SQLALCHEMY_TABLE'] = 'sessions'
    app.config['SESSION_COOKIE_NAME'] = 'projectsideascookie'

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:logachevmaksim07@localhost:5433/users_1'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'dfhdhfwqhjggx3463n32462h'

    # Установка пути к папке загрузки файлов для аватаров пользователей
    UPLOAD_FOLDER_AVATARS = os.path.join('app', 'static', 'avatars')
    app.config['UPLOAD_FOLDER_AVATARS'] = UPLOAD_FOLDER_AVATARS

    # Установка пути к папке загрузки файлов для картинок постов
    UPLOAD_FOLDER_POST_FILES = os.path.join('app', 'static', 'post_files')
    app.config['UPLOAD_FOLDER_POST_FILES'] = UPLOAD_FOLDER_POST_FILES

    # Установка максимального размера загружаемого файла
    app.config['MAX_CONTENT_LENGTH'] = 16 * 1920 * 1080

    db.init_app(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)

    with app.app_context():
        db.create_all()

    Session(app)

    from app.main import bp as main_bp
    from app.admin import admin_bp

    # Регистрируем Blueprint для основной части приложения
    app.register_blueprint(main_bp)

    # Регистрируем Blueprint для административной панели
    app.register_blueprint(admin_bp, url_prefix='/admin')

    return app


app = create_app()
