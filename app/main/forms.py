from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Email, EqualTo


class RegistrationForm(FlaskForm):
    login = StringField('Login', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    file = FileField('Profile Picture', validators=[FileAllowed(['jpg', 'png'])])  # Разрешенные форматы
    submit = SubmitField('Sign Up')


class CommentForm(FlaskForm):
    text = StringField('Comment', validators=[DataRequired()])
    submit = SubmitField('Post Comment')


class CreateGroupForm(FlaskForm):
    group_name = StringField('Название группы', validators=[DataRequired()])
    submit = SubmitField('Создать группу')