const list = document.querySelector('.list'),
    items = document.querySelectorAll('.blocks__item')

function filter(){
    list.addEventListener('click', event => {
        const targetId = event.target.dataset.id
        console.log(targetId)

        switch(targetId) {
            case 'all':
                break
            case 'winter':
                items.forEach(item => {
                    if (item.classList.cantains('winter')){
                        item.style.display = 'block'
                    } else{
                        item.style.display = 'none'}
                })
                break
        }
    })
}
filter()