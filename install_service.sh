#!/bin/bash -e

# TODO: get the current version
# VERSION=$1
# BACKUP_DIR=$2
CONF_DIR=/etc/check_update
SCRIPT_DIR=/usr/local/bin
SERVICE_DIR=~/.config/systemd/user
# Backup
cp version_list ${BACKUP_DIR}/

# Service: user level
if [ ! -d ${CONF_DIR} ]; then
    sudo mkdir ${CONF_DIR}
fi
# TODO: change the content of config file
sudo cp config/check_update.conf ${CONF_DIR}/
sudo chmod 755 ${CONF_DIR}/check_update.conf

sudo cp scripts/check_update.sh ${SCRIPT_DIR}/
sudo chmod 755 ${SCRIPT_DIR}/check_update.sh

cp systemd/user/check_update.service ${SERVICE_DIR}/
sudo chmod 644 ${SERVICE_DIR}/check_update.service

systemctl --user daemon-reload
systemctl --user enable check_update.service
