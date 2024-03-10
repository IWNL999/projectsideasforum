#!/usr/bin/python3.10
import sys
sys.path.insert(0, '/root/projectsideasforum')  # Путь к вашему проекту
from main import app as application  # Импортируем экземпляр приложения

# Дополнительная настройка, если необходимо
application.secret_key = 'dfhdhfwqhjggx3463n32462h'  # Пример

if __name__ == '__main__':
    application.run()
