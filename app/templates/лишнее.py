UPLOAD_FOLDER = 'static/pictures'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16*1024*1024
ALLOWED_EXTENSIONS = set['png', 'jpg', 'jpeg', 'gif']


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/registration', methods=['GET', 'POST'])
def upload_image():
    if 'file' in request.files:
        flash('No file part')
        return redirect(request.url)
    file = request.files['file']
    if file.filename == '':
        flash('Аватар не выбран')
        return redirect(request.url)
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        print('upload_image filename: ' + filename)

        flash('Аватар успешно выбран')
        return render_template('index.html', filename=filename)
    else:
        flash("Разрешенные форматы аватара: png, jpg, jpeg, gif")


@app.route('/registration')
def reg():
    return render_template("reg.html")

    try:
    connection.autocommit = True
    # the cursor for performing database operations
    cursor = connection.cursor()

    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT version();"
        )
        print(f"Server version: {cursor.fetchone()}")
except Exception as _ex:
    print("[INFO] Error while working with PostgreSQL", _ex)



@app.route('/registration', methods=['GET', 'POST'])
def events():
    form = user1()
    if request.method == 'POST' and form.validate_on_submit():
        evenement = user1(filename)
        otherfile = form.image.data.filename

        if otherfile:
            otherfile = secure_filename(otherfile)

            form.file.data.save(os.path.join(app.config['UPLOAD_FOLDER'], 'resumes/' + otherfile))
            evenement.image = otherfile
        db.session.add(evenement)
        db.session.commit()
        flash('Thanks for adding')
        return redirect(url_for('admin.events'))
    return render_template("reg.html", form=form)

cursor = connect.cursor()
cur=connect.cursor(cursor_factory=psycopg2.extras.DictCursor)


@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == 'POST':
        cur = connect.cursor(cursor_factory=psycopg2.extras.DictCursor)
        login = request.form['login']
        password = request.form['password']
        print(login)
        print(password)
        cur.execute("SELECT * FROM users1 WHERE login = %s", [login, ])
        total_row = cur.rowcount
        print(total_row)

        if total_row > 0:
            data = cur.fetchone()
            rs_password = data['admin_password']
            print(rs_password)
            if check_password_hash(rs_password, password):
                session['logged_in'] = True
                session['login'] = login
                msg = 'success'
            else:
                msg = 'No-data'
        else:
            msg = 'No-data'
    return jsonify(msg)


    {% for msg in get_flashes_messages (True) %}
    <div class="flash">{{msg}}</div>
    {% endfor %}

    if users and check_password_hash(users.password, pass1)


        # connect to exist database
        def psqlconnect():
            conn = psycopg2.connect(
                host=host,
                user=user1,
                password=password,
                database=db_name,
            )



class with1:
    def __enter__(self):
        self.var.append('enter')
        return self.var
    def __exit__(self):
        self.var.append('enter')
        return self.var


@app.route("/login", methods=["POST", "GET"])
def login():
    conn = psycopg2.connect(database=db_name, user=user, password='logachevmaksim07', port=5432)
    try:
        with conn.__enter__():
            with conn.cursor() as cursor:
                log = request.form.get('login')
                pass1 = request.form.get('password')
                if log and pass1:
                    users_log = user1.query.filter_by(login=log).first()
                    users_pass = user1.query.filter_by(password=pass1).first()
                    if users_log.count > 0 or users_pass.count > 0:
                        login_user(users_log, users_pass)
                        return render_template("index.html", login=users_log, password=users_pass)
                    else:
                        flash('Login or password is not correct')
                else:
                    flash('Please fill login and password fields')
    finally:
        conn.close()

    return render_template("login.html")

@app.route('/login', methods=['GET', 'POST'])
def login():
    next = request.args.get('next')
    user_1 = user1.query.get(id)
    if request.method == 'POST':
        log = request.form['login']
        email = request.form['email']
        pass2 = request.form['password']
        if authenticate(app.config['AUTH_SERVER'], login, password):
            user = user1.query.filter_by(login=login).first()
            if user_1 is None:
            else:
                user_1.login_status = 1
                db.session.commit()
                login_user(objects.SignedInUser(user_1.id, user_1.email, user_1.login_status == LoginStatus.Active))
                session['userid'] = user_1.id
                session['login'] = user_1.log
                session['email'] = user_1.email
                return render_template('user_login.html')



def create_tables():
    try:
        db.create_all()
    except OperationalError as e:
        print(f"Error creating tables: {e}")


#if __name__ == '__main__':
#    app.run(debug=True)

from sqlalchemy.exc import OperationalError, IntegrityError
