import os
from flask import render_template, url_for, request, redirect, flash, current_app, g, abort, jsonify
from sqlalchemy.exc import IntegrityError
from flask_login import login_user, login_required, logout_user, current_user
from werkzeug.utils import secure_filename
from app import db, login_manager
from app.main.forms import CommentForm, CreateGroupForm
from app.models import User, Article, Comment, GroupModel, UserGroup
from app.main import bp


@login_manager.user_loader
def load_user(user_id):
    group_id = request.args.get('group_id')
    return User.query.filter_by(id=user_id, group_id=group_id).first()


@bp.before_request
def inject_user():
    if current_user.is_authenticated:
        # Передача group_id в load_user через аргументы запроса (query parameters)
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
            post.author_avatar_url = url_for('static', filename=f'avatars/{post.author.file}')
        else:
            post.author_avatar_url = url_for('static', filename='avatars/default-avatar.png')
        post.author_name = post.author.login

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


@bp.route('/posts/<int:id>', methods=['GET', 'POST'])
def post_detail(id):
    article = Article.query.get_or_404(id)
    form = CommentForm()

    if form.validate_on_submit():
        comment = Comment(text=form.text.data, user_id=current_user.id, article_id=article.id)
        db.session.add(comment)
        db.session.commit()
        flash('Ваш комментарий опубликован!', 'success')
        return redirect(url_for('main.post_detail', id=id))

    # Получим комментарии для данной статьи
    comments = Comment.query.filter_by(article_id=id).all()

    return render_template("post_detail.html", article=article, form=form, comments=comments)


@bp.route('/posts/<int:id>/delete_comment/<int:comment_id>', methods=['POST'])
@login_required
def delete_comment(id, comment_id):
    comment = Comment.query.get_or_404(comment_id)
    # Проверяем, является ли текущий пользователь автором комментария
    if current_user.id != comment.author.id:
        abort(403)  # Ошибка доступа запрещена
    db.session.delete(comment)
    db.session.commit()

    flash('Комментарий успешно удален', 'success')

    # Возвращаемся на страницу с постом
    return redirect(url_for('main.post_detail', id=comment.article_id))


@bp.route('/create-article', methods=['POST', 'GET'])
@login_required
def create_article():
    if request.method == "POST":
        title = request.form['title']
        intro = request.form['intro']
        text = request.form['text']

        # Обработка файла
        file = request.files.get('file')
        filename = None
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(current_app.root_path, 'static', 'post_pictures', filename)
            file_path = file_path.replace('\\', '/')  # Заменяем обратные слеши на прямые
            file.save(file_path)

        article = Article(title=title, intro=intro, text=text, user_id=current_user.id, file=filename)

        try:
            db.session.add(article)
            db.session.commit()
            return redirect('/posts')
        except Exception as e:
            print(f"Error creating article: {e}")
            db.session.rollback()
            return "При добавлении статьи произошла ошибка"

    else:
        return render_template("create-article.html")


@bp.route('/posts/<int:id>/del', methods=['POST'])
@login_required
def post_delete(id):
    # Получаем пост или возвращаем ошибку 404, если пост не найден
    post = Article.query.get_or_404(id)

    # Проверяем, является ли текущий пользователь автором поста
    if post.user_id == current_user.id:
        try:
            # Удаляем пост из базы данных
            db.session.delete(post)
            db.session.commit()

            # Выводим сообщение об успехе
            flash('Пост успешно удален', 'success')
            return redirect(request.form.get('next', '/posts'))
        except Exception as e:
            # Выводим сообщение об ошибке и перенаправляем на страницу с постами пользователя
            flash(f'При удалении статьи произошла ошибка: {str(e)}', 'error')
            return redirect('/posts')
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
            # Используйте url_for для формирования URL страницы поста
            return redirect(url_for('main.post_detail', id=id))
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
                file_path = os.path.join(current_app.config['UPLOAD_FOLDER_AVATARS'], filename)
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
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER_AVATARS'], filename)
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
    form = CommentForm()
    return render_template('profile.html', user=user, form=form)


@bp.route('/profile/update', methods=['GET', 'POST'])
@login_required
def user_update():
    if request.method == 'POST':
        # Проверка наличия файла с изображением
        new_avatar = request.files.get('new_avatar')
        if new_avatar and allowed_file(new_avatar.filename):
            filename = secure_filename(new_avatar.filename)
            file_path = os.path.join(current_app.config['UPLOAD_FOLDER_AVATARS'], filename)
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


@bp.route('/search', methods=['POST'])
def search_posts():
    search_term = request.form.get('search_term', '')
    articles = Article.query.order_by(Article.date.desc()).all()

    filtered_posts = [post for post in articles if search_term.lower() in post.title.lower()]

    for post in filtered_posts:
        if post.author and post.author.file:
            post.author.avatar_url = url_for('static', filename=f'avatars/{post.author.file}')
        else:
            post.author.avatar_url = url_for('static', filename='avatars/default-avatar.png')

    return render_template('search_results.html', search_term=search_term, articles=filtered_posts)


# ... (ваш импорт и другой код)

@bp.route('/like/<int:user_id>', methods=['POST'])
@login_required
def like_user(user_id):
    recipient = User.query.get_or_404(user_id)

    # Проверяем, поставил ли текущий пользователь лайк
    if current_user.has_liked_user(user_id):
        # Если да, убираем лайк
        current_user.liked_users.remove(recipient)
        db.session.commit()

        # Обновленное количество лайков
        updated_likes = recipient.likes_received.count()

        # JSON с обновленным количеством лайков и информацией об отсутствии лайка
        return jsonify(likes=updated_likes, isLiked=False)

    # Иначе добавляем лайк
    current_user.liked_users.append(recipient)
    db.session.commit()

    # Обновленное количество лайков
    updated_likes = recipient.likes_received.count()

    # JSON с обновленным количеством лайков и информацией о наличии лайка
    return jsonify(likes=updated_likes, isLiked=True)


@bp.route('/groups', methods=['GET', 'POST'])
@login_required
def groups():
    create_group_form = CreateGroupForm()

    if create_group_form.validate_on_submit():
        group_name = create_group_form.group_name.data

        new_group = GroupModel(name=group_name)
        new_group.members.append(current_user)

        try:
            db.session.add(new_group)
            db.session.commit()
            flash('Группа успешно создана!', 'success')
            return redirect(url_for('main.groups'))
        except:
            flash('Ошибка при создании группы', 'danger')

    user_groups = current_user.groups
    return render_template('groups.html', user_groups=user_groups, create_group_form=create_group_form)


@bp.route('/groups/create-group', methods=['GET', 'POST'])
@login_required
def create_group():
    create_group_form = CreateGroupForm()

    if create_group_form.validate_on_submit():
        group_name = create_group_form.group_name.data

        # Создаем группу
        new_group = GroupModel(name=group_name, author_id=current_user.id)

        try:
            db.session.add(new_group)
            db.session.commit()

            # Получим ID только что созданной группы
            group_id = new_group.id

            # Теперь создаем запись в таблице user_group
            user_group = UserGroup(user_id=current_user.id, group_id=group_id)
            db.session.add(user_group)
            db.session.commit()

            flash('Группа успешно создана!', 'success')

            # Сформируем URL для перехода
            redirect_url = url_for('main.group_details', group_id=group_id)

            # Перенаправим на страницу с деталями группы
            return redirect(redirect_url)

        except Exception as e:
            db.session.rollback()
            flash('Ошибка при создании группы', 'danger')
            print(f"Error: {e}")

    return render_template('create-group.html', create_group_form=create_group_form)


@bp.route('/groups/<int:group_id>')
@login_required
def group_posts(group_id):
    group = GroupModel.query.get_or_404(group_id)

    group_posts = group.posts  # Предполагаем, что у группы есть атрибут posts с постами

    return render_template('group-posts.html', group=group, group_posts=group_posts)
