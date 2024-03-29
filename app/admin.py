from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, expose
from flask_login import current_user
from flask import redirect, url_for, current_app
from app import db
from app.models import User
from main import app


class AdminView(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        return redirect(url_for('login'))

class UserModelView(AdminView):
    column_exclude_list = ['password']
    column_searchable_list = ['login', 'email']

class RoleAssignView(AdminView):
    @expose('/')
    def index(self):
        return self.render('admin/assign_roles.html')

    @expose('/assign_moderator/<int:user_id>')
    def assign_moderator(self, user_id):
        with current_app.app_context():
            user = User.query.get(user_id)
            if user:
                user.set_moderator_role()
                return redirect(url_for('.index'))
            return redirect(url_for('.index'))

    @expose('/assign_admin/<int:user_id>')
    def assign_admin(self, user_id):
        with current_app.app_context():
            user = User.query.get(user_id)
            if user:
                user.set_admin_role()
                return redirect(url_for('.index'))
            return redirect(url_for('.index'))


def create_admin(admin):
    admin.add_view(UserModelView(User, db.session))
    admin.add_view(RoleAssignView(name='Assign Roles', endpoint='assign_roles'))


with current_app.app_context():
    admin.add_view(UserModelView(User, db.session))
    admin.add_view(RoleAssignView(name='Assign Roles', endpoint='assign_roles'))
