@bp.route('/posts/<int:id>/update', methods=['POST', 'GET'])
@login_required
def post_update(id):
    article = Article.query.get(id)

    # Проверяем, является ли текущий пользователь автором статьи
    if article.author != current_user:
        flash('Вы не можете редактировать эту статью', 'error')
        return redirect(url_for('main.post_detail', id=id))

    if request.method == 'POST':
        # Обработка текстовых данных статьи
        article.title = request.form.get('title', article.title)
        article.intro = request.form.get('intro', article.intro)
        article.text = request.form.get('text', article.text)

        # Обновление параметра group_id
        selected_group = request.form.get('groups')
        article.group_id = selected_group if selected_group != 'all' else None

        # Обработка загруженных изображений
        if 'file' in request.files:
            new_images = request.files.getlist('file')
            for new_image in new_images:
                if new_image and allowed_file(new_image.filename):
                    filename = secure_filename(new_image.filename)
                    file_path = os.path.join(current_app.config['UPLOAD_FOLDER_POST_PICTURES'], filename)
                    new_image.save(file_path)
                    if article.file:
                        article.file += ',' + filename
                    else:
                        article.file = filename

        db.session.commit()
        flash('Статья успешно обновлена!', 'success')
        return redirect(url_for('main.post_detail', id=id))
    groups = GroupModel.query.all()
    return render_template('post_update.html', article=article, groups=groups)


// Обработчик события изменения файла
document.getElementById('file').addEventListener('change', function(e) {
    const fileInput = e.target;
    const imagePreviewContainer = document.getElementById('image-preview-container');

    // Очистка контейнера предпросмотра перед добавлением новых изображений
    imagePreviewContainer.innerHTML = '';

    // Перебор всех выбранных файлов
    for (const file of fileInput.files) {
        if (file.type.startsWith('image/')) { // Проверка, что файл является изображением
            const reader = new FileReader();

            reader.onload = function(event) {
                // Создание элемента изображения для предпросмотра
                const img = document.createElement('img');
                img.src = event.target.result;
                img.classList.add('img-preview', 'post-image-edit'); // Добавление класса post-image-edit
                const index = Array.from(imagePreviewContainer.children).filter(child => child.tagName === 'IMG').length; // Получение индекса
                img.id = `image-preview-${index}`; // Установка уникального ID
                imagePreviewContainer.appendChild(img); // Добавление изображения в контейнер предпросмотра
            };

            reader.readAsDataURL(file); // Чтение содержимого файла как URL
        }
    }
});

//удаление картинки у поста
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('file').addEventListener('change', function(e) {
        const fileInput = e.target;
        const imagePreviewContainer = document.getElementById('image-preview-container');

        // Очистка контейнера предпросмотра перед добавлением новых изображений
        imagePreviewContainer.innerHTML = '';

        // Перебор всех выбранных файлов
        for (const file of fileInput.files) {
            if (file.type.startsWith('image/')) { // Проверка, что файл является изображением
                const reader = new FileReader();

                reader.onload = function(event) {
                    // Создание элемента изображения для предпросмотра
                    const img = document.createElement('img');
                    img.src = event.target.result;
                    img.classList.add('img-preview', 'post-image-edit'); // Добавление класса post-image-edit
                    const index = Array.from(imagePreviewContainer.children).filter(child => child.tagName === 'IMG').length; // Получение индекса
                    img.id = `image-preview-${index}`; // Установка уникального ID
                    imagePreviewContainer.appendChild(img); // Добавление изображения в контейнер предпросмотра
                };

                reader.readAsDataURL(file); // Чтение содержимого файла как URL
            }
        }
    });

    // Обработчик события клика на кнопки удаления изображения
    document.addEventListener('click', async function(event) {
        const target = event.target;
        if (target.classList.contains('btn-danger')) {
            event.preventDefault(); // Отменяем действие по умолчанию

            const form = target.closest('.delete-form'); // Находим форму, содержащую кнопку "Удалить"
            if (form) {
                const imageFilename = form.action.split('/').pop(); // Получаем имя файла из URL формы
                const postId = form.action.split('/')[4]; // Получаем ID статьи из URL формы

                // Проверяем наличие изображения перед его удалением
                const imageContainer = form.closest('.image-container');
                if (imageContainer) {
                    try {
                        const response = await fetch(form.action, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ filename: imageFilename })
                        });
                        if (response.ok) {
                            // Успешно удалено, скрываем изображение
                            imageContainer.remove();
                            alert('Картинка успешно удалена');
                        } else {
                            console.error('Failed to delete image');
                        }
                    } catch (error) {
                        console.error('Error deleting image:', error);
                    }
                }
            }
        }
    });
});


// Обработчик события клика на кнопки удаления изображения внутри контейнеров #image-preview-container и .existing-images
document.querySelectorAll('#image-preview-container .btn-danger, .existing-images .btn-danger').forEach(btn => {
    btn.addEventListener('click', async function(event) {
        event.preventDefault(); // Отменяем действие по умолчанию

        const form = this.closest('.delete-form'); // Находим форму, содержащую кнопку "Удалить"
        if (form) {
            const imageFilename = form.action.split('/').pop(); // Получаем имя файла из URL формы
            const postId = form.action.split('/')[4]; // Получаем ID статьи из URL формы

            // Проверяем наличие изображения перед его удалением
            const imageContainer = form.closest('.image-container');
            if (imageContainer) {
                try {
                    const response = await fetch(form.action, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ filename: imageFilename })
                    });
                    if (response.ok) {
                        // Успешно удалено, скрываем изображение
                        imageContainer.remove();
                        alert('Картинка успешно удалена');
                    } else {
                        console.error('Failed to delete image');
                    }
                } catch (error) {
                    console.error('Error deleting image:', error);
                }
            }
        }
    });
});



@bp.route('/posts/<int:id>/delete_image/<filename>', methods=['POST', 'DELETE'])
@login_required
def delete_post_image(id, filename):
    if request.method == 'DELETE':
        post = Article.query.get_or_404(id)

        # Проверяем, является ли пользователь автором статьи
        if post.author != current_user:
            return jsonify({'message': 'Вы не можете удалять изображения этой статьи'}), 403

        # Проверяем, существует ли изображение в списке файлов статьи
        if filename in post.file.split(','):
            try:
                # Удаляем файл изображения из папки
                file_path = os.path.join(current_app.config['UPLOAD_FOLDER_POST_PICTURES'], filename)
                if os.path.exists(file_path):
                    os.remove(file_path)

                # Удаляем имя файла из списка файлов в статье
                file_list = post.file.split(',')
                file_list.remove(filename)
                post.file = ','.join(file_list)

                # Сохраняем изменения в базе данных
                db.session.commit()

                return jsonify({'message': 'Изображение успешно удалено'}), 200
            except Exception as e:
                return jsonify({'message': f'При удалении изображения произошла ошибка: {str(e)}'}), 500
        else:
            return jsonify({'message': 'Изображение не найдено в статье'}), 404