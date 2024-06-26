# app/admin.py

from flask import Blueprint, render_template, redirect, url_for, jsonify
from flask_login import current_user
from app import db
from app.models import User, Moderator, Admin, BannedUser

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')


@admin_bp.route('/admin_panel', methods=['GET'])
def admin_panel():
    if current_user.is_authenticated and current_user.is_admin:
        all_users = User.query.all()
        for user in all_users:
            if user.file:
                user.avatar_url = url_for('static', filename=f'avatars/{user.file}')
            else:
                user.avatar_url = url_for('static', filename='avatars/default-avatar.png')
        return render_template('admin-panel.html', all_users=all_users)
    else:
        return redirect(url_for('main.index'))


@admin_bp.route('/assign_role/<int:user_id>/<role>', methods=['POST'])
def assign_role(user_id, role):
    user = User.query.get(user_id)
    if user:
        if user.is_banned:
            # Если пользователь забанен, обнуляем все его роли перед назначением новой
            user.is_admin = False
            user.is_moderator = False
        if role == 'moderator':
            user.is_moderator = True
            moderator = Moderator(user_id=user.id)
            db.session.add(moderator)
        elif role == 'admin':
            user.is_admin = True
            admin = Admin(user_id=user.id)
            db.session.add(admin)
        elif role == 'user':
            moderator = Moderator.query.filter_by(user_id=user.id).first()
            if moderator:
                db.session.delete(moderator)
            admin = Admin.query.filter_by(user_id=user.id).first()
            if admin:
                db.session.delete(admin)
            user.is_admin = False
            user.is_moderator = False
        db.session.commit()
        return jsonify({'message': f'Role "{role}" assigned successfully for user with ID {user_id}'}), 200
    else:
        return jsonify({'error': f'User with ID {user_id} not found'}), 404


@admin_bp.route('/ban_user/<int:user_id>/<reason>', methods=['POST'])
def ban_user(user_id, reason):
    user = User.query.get(user_id)
    if user:
        if user.is_banned:
            # Если пользователь уже забанен, обновляем только причину бана
            banned_user = user.banned_users[0] if user.banned_users else BannedUser(user_id=user.id, reason=reason)
            banned_user.reason = reason
        else:
            # Если пользователь не был забанен ранее, создаем новую запись
            banned_user = BannedUser(user_id=user.id, reason=reason)
            db.session.add(banned_user)

        # Устанавливаем статус бана для пользователя
        user.is_banned = True

        # Обнуляем все роли пользователя
        user.is_admin = False
        user.is_moderator = False

        db.session.commit()

        return jsonify({'message': f'User with ID {user_id} has been banned for reason: {reason}'}), 200
    else:
        return jsonify({'error': f'User with ID {user_id} not found'}), 404



