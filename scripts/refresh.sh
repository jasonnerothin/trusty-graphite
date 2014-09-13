#!/bin/sh
sudo /opt/graphite/bin/carbon-cache.py status || sudo /opt/graphite/bin/carbon-cache.py start
sudo /etc/init.d/apache2 restart