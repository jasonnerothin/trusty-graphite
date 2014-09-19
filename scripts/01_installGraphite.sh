#!/bin/bash

source ./vars.sh

# install stuff from apt
sudo apt-get -y install libtool git memcached expect
sudo apt-get -y install apache2 libapache2-mod-wsgi libapache2-mod-python
sudo apt-get -y install python-dev python-cairo-dev python-ldap python-memcache python-pysqlite2 python-pip
sudo apt-get -y install libpq-dev postgresql postgresql-contrib

sudo pip install django==1.5    
sudo pip install django-tagging
sudo pip install pytz
sudo pip install pyparsing
sudo pip install 'Twisted<12.0'
sudo pip install carbon
sudo pip install whisper
sudo pip install graphite-web
sudo pip install psycopg2

cp ${PG_SCRIPT} vars.sh ${TMPDIR}
chmod a+x /tmp/vars.sh /tmp/${PG_SCRIPT}
sudo su postgres -c "/bin/bash /tmp/${PG_SCRIPT}"