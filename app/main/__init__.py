from flask import Blueprint
from app.admin import admin_bp  # Импортируем Blueprint для административной панели


bp = Blueprint('main', __name__)
# Регистрируем Blueprint для административной панели
bp.register_blueprint(admin_bp, url_prefix='/admin')
from app.main import routes
