#!/usr/bin/python3.10
import sys
sys.path.insert(0, '/var/www/projectsideasforum')  

from app.__init__ import app as application

application.secret_key = 'dfhdhfwqhjggx3463n32462h'

if __name__ == '__main__':
    application.run()
