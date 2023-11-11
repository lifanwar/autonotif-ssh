#!/bin/bash

# Prepare any message you want
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
geoip_info="$(geoiplookup $login_ip | cut -d ' ' -f 4-7)"
login_date="$(date +"%e %b %Y, %a %r")"
login_name="$(whoami)"

# For new line I use $'\n' here
message="New login to $login_name"$'\n'"ip: $login_ip"$'\n'"Locate: $geoip_info"$'\n'"$login_date"

# Send it to Telegram
telegramnotif "$message"
