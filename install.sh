#!/bin/bash

# install geoiplookup
if ! command -v geoiplookup &> /dev/null; then
    echo "Installing geoiplookup..."
    sudo apt install geoip-bin
fi
if ! command -v curl &> /dev/null; then
    echo "Installing curl..."
    sudo apt install curl
fi

# execution telegram.sh file
chmod +x telegramnotif.sh

# waiting
sleep 1

# move telegram to executable
sudo mv telegramnotif.sh /usr/bin/telegramnotif

# make telegram executable as root 
sudo chown root:root /usr/bin/telegramnotif

# Secure it with permissions to prevent privilege escalation
sudo chmod 755 /usr/bin/telegramnotif

# move notify.sh to file auto send
sudo mv notify.sh /etc/profile.d/notify.sh

# check if telegram bot can send chat
telegramnotif "Succsess Connected"
echo "Succsess connected"
