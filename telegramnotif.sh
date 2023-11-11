#!/bin/bash

# copy your chat id and bot token, delete symbol "><"
CHAT_ID=<your_chatid>
BOT_TOKEN=<your_bot_token>

# Detect if use ask for help
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"text message\""
  exit 0
fi

if [ -z "$1" ]
  then
    echo "Add message text as second arguments"
    exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "You can pass only one argument. For string with spaces put it on quotes"
    exit 0
fi

# Send the message 
curl -s --data "text=$1" --data "chat_id=$CHAT_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
