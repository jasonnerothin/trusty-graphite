#!/bin/bash

source /tmp/vars.sh

CREATE_USER="CREATE USER ${GRAPHITE_USER}"
CREATE_DB="CREATE DATABASE ${GRAPHITE_DB}"
GRANT_CMD="GRANT ALL PRIVILEGES ON DATABASE ${GRAPHITE_DB} TO ${GRAPHITE_USER}"
PWD_CMD="ALTER USER ${GRAPHITE_USER} PASSWORD '${GRAPHITE_PWD}'"


echo "${CREATE_USER}"
echo "${CREATE_USER}" | psql

echo "${CREATE_DB}"
echo "${CREATE_DB}" | psql

echo "${GRANT_CMD}"
echo "${GRANT_CMD}" | psql

echo "${PWD_CMD}"
echo "${PWD_CMD}" | psql

echo "local all graphiteuser    md5" >> ${PG_CONF}