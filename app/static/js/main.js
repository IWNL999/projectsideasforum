document.addEventListener('DOMContentLoaded', function () {
    const likeButtons = document.querySelectorAll('.like-button');
    const images = document.querySelectorAll('.post-image');
    const modal = document.getElementById("myModal");
    const modalImg = document.getElementById("img01");
    const closeButton = document.getElementsByClassName("close")[0];

    async function toggleLike(userId) {
        try {
            const response = await fetch(`/like/${userId}`, { method: 'POST' });
            const data = await response.json();

            const likeCountElement = document.getElementById(`like-count-${userId}`);
            const likeButton = document.getElementById(`like-button-${userId}`);

            if (likeCountElement && likeButton) {
                likeCountElement.textContent = data.likes;

                // Изменяем классы и текст кнопки
                likeButton.classList.toggle('liked', data.isLiked);
                likeButton.textContent = data.isLiked ? 'Unlike' : 'Like';
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }

    // Обработчик события для кнопок "лайк"
    likeButtons.forEach(button => {
        button.addEventListener('click', function () {
            console.log('Button clicked!');
            const userId = button.dataset.userId;
            console.log('User ID:', userId);

            toggleLike(userId);
        });
    });

    // Обработчик события для открытия модального окна при щелчке на изображении
    images.forEach(image => {
        image.addEventListener('click', function () {
            modal.style.display = "block";
            modalImg.src = this.src;
        });
    });

    // Обработчик события для закрытия модального окна при щелчке на кнопке закрытия
    closeButton.addEventListener('click', function () {
        modal.style.display = "none";
    });
});
