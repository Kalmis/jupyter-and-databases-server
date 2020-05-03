#!/bin/bash
# Make sure the ip file exists
echo "$(date "+%Y-%m-%d_%H%M%S") Starting send-changed-ip-to-telegram.txt"
touch /tmp/ip.txt
CURRENT_IP=$(curl -s ifconfig.io)
SAVED_IP=$(cat /tmp/ip.txt)
if [ "$CURRENT_IP" != "$SAVED_IP" ]; then
    curl -s "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage?chat_id=$TELEGRAM_CHAT_ID&text=$CURRENT_IP"; echo $CURRENT_IP > /tmp/ip.txt
fi