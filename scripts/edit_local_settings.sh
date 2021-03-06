#!/bin/bash -x

source /home/vagrant/scripts/vars.sh

# configure graphite (python) settings

cd ${GRAPHITE_PYTHON_CONF_DIR}

sudo sed -i "s/GRAPHITE_DB/${GRAPHITE_DB}/;" ${SCRIPT_DIR}${DB_SETTINGS_FILE}
sudo sed -i "s/GRAPHITE_PWD/${GRAPHITE_PWD}/;" ${SCRIPT_DIR}${DB_SETTINGS_FILE}
sudo sed -i "s/GRAPHITE_USER/${GRAPHITE_USER}/;" ${SCRIPT_DIR}${DB_SETTINGS_FILE}
sudo cp ${SCRIPT_DIR}${DB_SETTINGS_FILE} ${TMPDIR}

cd ${GRAPHITE_PYTHON_CONF_DIR}

sudo sed -i 's/#TIME_ZONE/TIME_ZONE/;s/America\/Los_Angeles/America\/Chicago/' ${LOCAL_SETTINGS_FILE}
sudo sed -i 's/#SECRET_KEY/SECRET_KEY/;s/UNSAFE_DEFAULT/1070b856de49b101538547b65c8d8c51/' ${LOCAL_SETTINGS_FILE}

sudo sed -i '204 a LOG_METRIC_ACCESS = True' ${LOCAL_SETTINGS_FILE}
sudo sed -i '205 a LOG_CACHE_PERFORMANCE = True' ${LOCAL_SETTINGS_FILE}
sudo sed -i '206 a LOG_RENDERING_PERFORMANCE = True' ${LOCAL_SETTINGS_FILE}

sudo sed -i '204 a LOG_METRIC_ACCESS = True' ${LOCAL_SETTINGS_FILE}
sudo sed -i '205 a LOG_CACHE_PERFORMANCE = True' ${LOCAL_SETTINGS_FILE}
sudo sed -i '206 a LOG_RENDERING_PERFORMANCE = True' ${LOCAL_SETTINGS_FILE}

#sudo cp ${LOCAL_SETTINGS_FILE} ${LOCAL_SETTINGS_FILE}.bak
sudo cat ${LOCAL_SETTINGS_FILE} ${TMPDIR}${DB_SETTINGS_FILE} > ${TMPDIR}${LOCAL_SETTINGS_FILE}
sudo cp ${TMPDIR}${LOCAL_SETTINGS_FILE} ${LOCAL_SETTINGS_FILE}