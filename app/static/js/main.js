document.querySelectorAll('.like-button').forEach(button => {
    button.addEventListener('click', async function () {
        console.log('Button clicked!');
        const userId = button.dataset.userId;
        console.log('User ID:', userId);

        try {
            const response = await fetch(`/like/${userId}`, { method: 'POST' });
            const data = await response.json();

            const likeCountElement = document.getElementById(`like-count-${userId}`);

            if (likeCountElement) {
                likeCountElement.textContent = data.likes;

                // Изменяем классы и текст кнопки
                button.classList.toggle('liked', data.isLiked);
                button.textContent = data.isLiked ? 'Unlike' : 'Like';
            }
        } catch (error) {
            console.error('Error:', error);
        }
    });
});

// Открыть модальное окно с изображением при клике на изображение
document.querySelectorAll('.post-image').forEach(image => {
    image.addEventListener('click', function() {
        const modal = document.getElementById("myModal");
        const modalImg = document.getElementById("img01");
        modal.style.display = "block";
        modalImg.src = this.src;
    });
});

// Закрыть модальное окно при клике на кнопку закрытия
document.querySelector('.close').addEventListener('click', function() {
    const modal = document.getElementById("myModal");
    modal.style.display = "none";
});


// Получаем ссылки на модальное окно и изображение
var modal = document.getElementById("myModal");
var modalImg = document.getElementById("img01");

// Получаем все изображения с классом "post-image"
var images = document.querySelectorAll('.post-image');

// Для каждого изображения добавляем обработчик события для открытия модального окна
images.forEach(function(image) {
    image.addEventListener('click', function() {
        modal.style.display = "block"; // Отображаем модальное окно
        modalImg.src = this.src; // Устанавливаем источник изображения в модальном окне
    });
});

// Получаем кнопку закрытия модального окна
var closeButton = document.getElementsByClassName("close")[0];

// Добавляем обработчик события для закрытия модального окна при клике на кнопку закрытия
closeButton.addEventListener('click', function() {
    modal.style.display = "none"; // Скрываем модальное окно
});

// Обработчик события изменения файла
document.getElementById('file').addEventListener('change', function(e) {
    const fileInput = e.target;
    const imagePreview = document.getElementById('image-preview'); // Получаем изображение для предпросмотра

    // Очищаем предыдущее содержимое предпросмотра
    imagePreview.innerHTML = '';

    // Перебираем все выбранные файлы
    for (const file of fileInput.files) {
        if (file.type.startsWith('image/')) {
            const reader = new FileReader();

            reader.onload = function(event) {
                // Создаем элемент изображения для предпросмотра
                const img = document.createElement('img');
                img.src = event.target.result;
                img.classList.add('img-preview');
                imagePreview.appendChild(img); // Добавляем изображение в контейнер предпросмотра
            };

            reader.readAsDataURL(file); // Читаем содержимое файла как URL
        }
    }
});

// Функция для скрытия пользователя
function hideUser() {
    var form = document.getElementById("hide-form");
    var formData = new FormData(form);

    fetch("/hide_user", {
        method: "POST",
        body: formData
    })
    .then(response => {
        if (response.ok) {
            // Обновляем контент страницы или выполняем другие действия
            console.log("User hidden successfully");
        } else {
            console.error("Failed to hide user");
        }
    })
    .catch(error => {
        console.error("Error:", error);
    });
}

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

    document.querySelectorAll('.delete-image').forEach(button => {
        button.addEventListener('click', async function() {
            const imageFilename = button.dataset.image;
            const postId = button.dataset.postId;  // Передаем ID статьи через data-post-id атрибут кнопки
            try {
                const response = await fetch(`/posts/${postId}/delete_image/${imageFilename}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ filename: imageFilename })
                });
                if (response.ok) {
                    // Успешно удалено, скрываем изображение
                    button.closest('.image-container').remove();
                } else {
                    console.error('Failed to delete image');
                }
            } catch (error) {
                console.error('Error deleting image:', error);
            }
        });
    });
});


