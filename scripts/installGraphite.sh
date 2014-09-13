#!/bin/sh

# install stuff from apt

sudo aptitude install memcached -y
sudo aptitude install apache2 -y
# * Starting web server apache2
# AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 10.0.2.15. Set the 'ServerName' directive globally to suppress this message
# *
sudo aptitude install git -y
sudo aptitude install python-pip -y

sudo aptitude install libapache2-mod-wsgi -y
sudo aptitude install python-memcache -y
sudo aptitude install python-cairo -y

sudo easy_install --upgrade django
sudo easy_install --upgrade django-tagging

sudo easy_install --upgrade pytz
sudo easy_install --upgrade pyparsing

# build graphite deps from source

mkdir projects
cd projects

git clone https://github.com/graphite-project/ceres.git
cd ceres/
sudo python setup.py install
cd ..

git clone https://github.com/graphite-project/whisper.git
cd  whisper/
sudo python setup.py install
cd ..

# at this point we should be able to build graphite-web from github.

git clone https://github.com/graphite-project/graphite-web.git
cd graphite-web
./check-dependencies.py || exit 666
cd ..

git clone https://github.com/graphite-project/carbon.git

cd carbon/
sudo python setup.py install
cd ..

cd graphite-web/
sudo python setup.py install
cd ../