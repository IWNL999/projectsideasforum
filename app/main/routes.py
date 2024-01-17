import os
from flask import render_template, url_for, request, redirect, flash, current_app, g
from sqlalchemy.exc import IntegrityError
from flask_login import login_user, login_required, logout_user, current_user
from werkzeug.utils import secure_filename
from app import db, login_manager
from app.models import User, Article
from app.main import bp


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


@bp.before_request
def inject_user():
    if current_user.is_authenticated:
        g.current_user = current_user
        g.current_user_avatar = current_user.avatar_url()
    else:
        g.current_user = None
        g.current_user_avatar = url_for('static', filename='avatars/default-avatar.png')


@bp.route('/')
@bp.route('/home')
def index():
    latest_posts = Article.query.order_by(Article.date.desc()).limit(3).all()
    for post in latest_posts:
        if post.author.file:
            post.author.avatar_url = url_for('static', filename=f'avatars/{post.author.file}')
        else:
            post.author.avatar_url = url_for('static', filename='avatars/default-avatar.png')
    return render_template("index.html", latest_posts=latest_posts, user=current_user)


@bp.route('/about')
def about():
    return render_template("about.html")


@bp.route('/posts')
def posts():
    articles = Article.query.order_by(Article.date.desc()).all()

    for post in articles:
        if post.author and post.author.file:
            post.author.avatar_url = url_for('static', filename=f'avatars/{post.author.file}')
        else:
            post.author.avatar_url = url_for('static', filename='avatars/default-avatar.png')

    return render_template("posts.html", articles=articles)


@bp.route('/posts/<int:id>')
def post_detail(id):
    article = Article.query.get(id)
    return render_template("post_detail.html", article=article)


@bp.route('/create-article', methods=['POST', 'GET'])
@login_required
def create_article():
    if request.method == "POST":
        title = request.form['title']
        intro = request.form['intro']
        text = request.form['text']

        article = Article(title=title, intro=intro, text=text, user_id=current_user.id)

        try:
            db.session.add(article)
            db.session.commit()
            return redirect('/posts')
        except:
            return "При добавлении статьи произошла ошибка"
    else:
        return render_template("create-article.html")


@bp.route('/posts/<int:id>/del')
@login_required
def post_delete(id):
    # Получаем пост или возвращаем ошибку 404, если пост не найден
    article = Article.query.get_or_404(id)

    # Проверяем, является ли текущий пользователь автором поста
    if article.user_id == current_user.id:
        try:
            # Удаляем пост из базы данных
            db.session.delete(article)
            db.session.commit()

            # Выводим сообщение об успехе
            flash('Пост успешно удален', 'success')
            return redirect('/posts')
        except:
            return "При удалении статьи произошла ошибка"
    else:
        # Если пользователь не является автором, выводим сообщение об ошибке и оставляем его на текущей странице
        flash('Вы не можете удалить этот пост', 'error')
        return redirect(f'/posts/{id}')


@bp.route('/posts/<int:id>/update', methods=['POST', 'GET'])
@login_required
def post_update(id):
    article = Article.query.get(id)
    if article.user_id != current_user.id:
        flash('Вы не можете редактировать этот пост', 'error')
        return redirect(f'/posts/{id}')

    if request.method == "POST":
        article.title = request.form['title']
        article.intro = request.form['intro']
        article.text = request.form['text']

        try:
            db.session.commit()
            return redirect('/posts')
        except:
            return "При редактировании статьи произошла ошибка"
    else:
        return render_template("post_update.html", article=article)


@bp.route('/your-posts', methods=['GET', 'POST'])
@login_required
def your_posts():
    articles = Article.query.filter_by(user_id=current_user.id).order_by(Article.date.desc()).all()

    for post in articles:
        if post.author and post.author.file:
            post.author.avatar_url = url_for('static', filename=f'avatars/{post.author.file}')
        else:
            post.author.avatar_url = url_for('static', filename='avatars/default-avatar.png')

    return render_template("your-posts.html", articles=articles)


@bp.route("/login", methods=["POST", "GET"])
def login():
    if request.method == 'POST':
        login_or_email = request.form.get('login')
        password = request.form.get('password')

        user = User.query.filter((User.login == login_or_email) | (User.email == login_or_email)).first()
        if user and user.check_password(password):
            login_user(user)
            flash('Вы успешно вошли в аккаунт!', 'success')
            return redirect(url_for('main.user_profile_by_id', user_id=user.id))
        else:
            flash('Логин или пароль не корректны', 'error')
    return render_template("login.html")


@bp.route("/logout")
@login_required
def logout():
    logout_user()
    flash('Вы вышли из своего аккаунта', 'info')
    return redirect(url_for('main.login'))


ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@bp.route('/registration', methods=['POST', 'GET'])
def registration():
    if request.method == 'POST':
        login1 = request.form['login']
        password1 = request.form['password']
        email = request.form['email']

        # Проверяем, был ли файл отправлен с формой
        if 'file' in request.files:
            file = request.files['file']
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
                file.save(file_path)
            else:
                # Обработка случая, когда файл не был передан или в недопустимом формате
                file_path = None
        else:
            # Обработка случая, когда ключ 'file' отсутствует в запросе
            file_path = None

        # Остальной код регистрации
        user = User(login=login1, password=password1, email=email, file=filename)
        try:
            user.set_password(password1)
            db.session.add(user)
            db.session.commit()
            return render_template('signup.html')
        except IntegrityError:
            db.session.rollback()
            flash('Пользователь с такими данными уже существует. Выберите другие учетные данные.', 'error')
            return render_template('reg.html')
        except Exception as e:
            print(f"Error during registration: {e}")
            db.session.rollback()
            flash('При регистрации пользователя произошла ошибка.', 'error')

    return render_template('reg.html')


@bp.route('/signup', methods=['POST'])
def signup():
    login1 = request.form['login']
    password1 = request.form['password']
    email = request.form['email']
    file_path = None

    if 'file' in request.files:
        file = request.files['file']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
    else:
        # Обработка случая, когда ключ 'file' отсутствует в запросе
        flash("File not provided in the request.")

    user = User(login=login1, password=password1, email=email, file=file_path)
    db.session.add(user)
    db.session.commit()
    return render_template('signup.html')
    user = User(login=login1, password=password1, email=email, file=file_path)
    db.session.add(user)
    db.session.commit()
    return render_template('signup.html')


@bp.route('/profile/<int:user_id>')
@login_required
def user_profile_by_id(user_id):
    user = User.query.get_or_404(user_id)
    return render_template('profile.html', user=user)


@bp.route('/profile/update', methods=['GET', 'POST'])
@login_required
def user_update():
    if request.method == 'POST':
        # Проверка наличия файла с изображением
        new_avatar = request.files.get('new_avatar')
        if new_avatar and allowed_file(new_avatar.filename):
            filename = secure_filename(new_avatar.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
            new_avatar.save(file_path)

            # Обновление аватара пользователя
            current_user.file = filename

        # Обновление остальных данных профиля
        current_user.description = request.form.get('new_description', current_user.description)

        # Сохранение изменений в базе данных
        db.session.commit()

        flash('Профиль успешно обновлен!', 'success')
        return redirect(url_for('main.user_profile_by_id', user_id=current_user.id))

    return render_template('user_update.html')




