from flask_bcrypt import Bcrypt
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from sqlalchemy.exc import OperationalError
db = SQLAlchemy()
bcrypt = Bcrypt()
login_manager = LoginManager()
login_manager.login_view = 'login'

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://projideasforum:projideasforumpass@localhost/maindb'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'dfhdhfwqhjggx3463n32462h'
    UPLOAD_FOLDER = 'static/avatars'
    app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
    app.config['MAX_CONTENT_LENGTH'] = 16 * 1920 * 1080
    db.init_app(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)
    from app.main import bp
    app.register_blueprint(bp)
    return app
