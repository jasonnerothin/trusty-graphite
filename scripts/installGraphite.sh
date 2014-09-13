#!/bin/sh
sudo aptitude install graphite-web
sudo aptitude install python-memcache
sudo aptitude install memcached
sudo aptitude install git
mkdir projects
cd projects
git clone https://github.com/graphite-project/graphite-web.git
git clone https://github.com/graphite-project/carbon.git
git clone https://github.com/graphite-project/whisper.git
git clone https://github.com/graphite-project/ceres.git
cd ceres/
sudo python setup.py install
cd ../carbon/
sudo python setup.py install
cd ../whisper/
sudo python setup.py install
cd ../graphite-web/
sudo python setup.py install
