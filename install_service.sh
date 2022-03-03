#!/bin/bash -e

# user level
sudo mkdir /etc/check_update
sudo cp config/check_update.conf /etc/check_update/
sudo chmod 755 /etc/check_update/check_update.conf

sudo cp scripts/check_update.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/check_update.sh

sudo cp systemd/user/check_update.service ~/.config/systemd/user/
sudo chmod 644 ~/.config/systemd/user/check_update.service

systemctl --user daemon-reload

# system level
# sudo cp config/check_update.conf /etc/sysconfig/
# sudo chmod 550 /etc/sysconfig/check_update.conf

# sudo cp scripts/check_update.sh /usr/local/bin/
# sudo chmod 550 /usr/local/bin/check_update.sh

# sudo cp systemd/system/check_update.service /etc/systemd/system/

# systemctl daemon-reload