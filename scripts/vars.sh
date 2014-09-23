#!/bin/bash

export GRAPHITE_USER="graphiteuser"
export GRAPHITE_DB="graphiteuser"
export GRAPHITE_PWD="foo"

export GRAPHITE_PYTHON_CONF_DIR="/opt/graphite/webapp/graphite"
export LOCAL_SETTINGS_FILE="local_settings.py"

export TMPDIR="/tmp/"
export SCRIPT_DIR="/home/vagrant/scripts/"

export PG_SCRIPT="create_postgresdb.sh"
export PG_CONF="/etc/postgresql/9.3/main/pg_hba.conf"
export DB_SETTINGS_FILE="pgsql-def.txt"

export APACHE_CONF_DIR="/etc/apache2/"
export APACHE_CONF_FILE="apache2.conf"
export VHOST_FILE="000-graphite.conf"

export GRAPHITE_CONF_DIR="/opt/graphite/conf"
export CARBON_CONF_FILE="carbon.conf"
