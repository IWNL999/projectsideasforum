#!/usr/bin/python3.10
import sys
sys.path.insert(0, '/var/www/projectsideasforum')

from main import app as application  # Импортируйте экземпляр вашего Flask приложения

application.secret_key = 'dfhdhfwqhjggx3463n32462h'

if __name__ == '__main__':
    application.run()
