#!/bin/bash -x

source ./vars.sh

# create conf files from examples
cd /opt/graphite/conf/
sudo cp graphite.wsgi.example graphite.wsgi
sudo cp carbon.conf.example carbon.conf
sudo cp storage-schemas.conf.example storage-schemas.conf

cd ${GRAPHITE_SETTINGS_HOME}
sudo cp local_settings.py.example ${LOCAL_SETTINGS_FILE}

. ${SCRIPT_DIR}edit_local_settings.sh

sudo chown -R www-data:www-data /opt/graphite/storage/

sudo python manage.py syncdb

#You just installed Django's auth system, which means you don't have any superusers defined.
#Would you like to create one now? (yes/no): yes
#Username (leave blank to use 'root'):
#Email address: jason@gigaspaces.com
#Password:
#Password (again):

sudo /opt/graphite/bin/carbon-cache.py start

# configure apache to load the wsgi application
cd /etc/apache2/sites-available/
sudo cp /opt/graphite/examples/example-graphite-vhost.conf graphite-vhost.conf

cd /etc/apache2/sites-enabled/
sudo rm -f 000-default.conf ${VHOST_FILE}
sudo ln -s ../sites-available/graphite-vhost.conf ${VHOST_FILE}
sudo mkdir /var/run/apache2/wsgi

sudo sed -i 's/WSGISocketPrefix run\/wsgi/WSGISocketPrefix \/var\/run\/apache2\/wsgi/' ${VHOST_FILE}
sudo sed -i '41 a \                Require all granted' ${VHOST_FILE}
sudo sed -i '58 a \                Require all granted' ${VHOST_FILE}

# http://greenlegos.wordpress.com/2012/09/09/graphite-installation/
# suggests that media should be something like:
# Alias /media/ "/usr/local/lib/python2.7/dist-packages/django/contrib/admin/media/"
# sudo sed -i 's/Alias \/media\/.*$/Alias \/media\/ "\/usr\/local\/lib\/python2.7\/dist-packages\/Django-1.7-py2.7.egg\/django\/contrib\/admin\/static\/admin\/"/' 000-graphite.conf

# This is hacky, but seems to work...
# Instead, we should run the service under a non-root user and then
cd /opt/graphite/storage/log
sudo chmod a+w webapp/
sudo chmod -R a+w /opt/graphite/storage

# create convenience links in ~
cd
ln -s /opt/graphite/storage/log/webapp webapp_logs
ln -s /opt/graphite/webapp/graphite graphite_conf