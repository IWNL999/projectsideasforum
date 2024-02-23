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

// Открыть модальное окно с изображением
function openModal(imgSrc) {
    const modal = document.getElementById("myModal");
    const modalImg = document.getElementById("img01");

    modal.style.display = "block";
    modalImg.src = imgSrc;
}

// Закрыть модальное окно
document.getElementsByClassName("close")[0].onclick = function () {
    document.getElementById("myModal").style.display = "none";
}

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

<script>
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
</script>
