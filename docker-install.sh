#!/bin/bash
set -u

DOCKER_REPO="dalijolijo"
CHANNEL="coin_analyse"

#
# Set telegram user pwd
#
echo -n "Enter new password for [telegram] user and Hit [ENTER]: "
read TELEPWD

#
# Set telegram API data
#
echo -n "Enter your Telegram API ID and Hit [ENTER]: "
read API_ID
echo -n "Enter your Telegram API Hash and Hit [ENTER]: "
read API_HASH
echo -n "Enter your Telegram Channel/Chat (e.g. coin_analyse) which you want to export users and Hit [ENTER]: "
read CHANNEL

#
# Pull telegram-get-participants
#
docker pull ${DOCKER_REPO}/https://github.com/dalijolijo/telegram-get-participants.git
docker run --name telegram-export -e TELEPWD="${TELEPWD}" -e API_ID="${API_ID}" -e API_HASH="${API_HASH}" -e CHANNEL="${CHANNEL}" -v /home/telegram:/home/telegram:rw -d ${DOCKER_REPO}/telegram-get-participants
