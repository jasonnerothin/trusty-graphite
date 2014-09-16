#!/bin/sh

# install stuff from apt
sudo apt-get -y install git apache2 memcached libapache2-mod-wsgi libapache2-mod-python python-dev python-cairo-dev python-ldap python-memcache python-pysqlite2 python-pip sqlite3 libtool

sudo pip install django==1.5    
sudo pip install django-tagging
sudo pip install pytz
sudo pip install pyparsing
sudo pip install 'Twisted<12.0'
sudo pip install carbon
sudo pip install whisper
sudo pip install graphite-web
