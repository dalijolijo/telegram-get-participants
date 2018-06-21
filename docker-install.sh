#!/bin/bash
set -u

DOCKER_REPO="dalijolijo"
CHANNEL="coin_analyse"
CONTAINER_NAME="telegram-export"

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
docker docker rm ${CONTAINER_NAME} >/dev/null
docker pull ${DOCKER_REPO}/https://github.com/dalijolijo/telegram-get-participants.git
docker run --name ${CONTAINER_NAME} -e TELEPWD="${TELEPWD}" -e API_ID="${API_ID}" -e API_HASH="${API_HASH}" -e CHANNEL="${CHANNEL}" -v /home/telegram:/home/telegram:rw -d ${DOCKER_REPO}/telegram-get-participants

#
# Show result and give user instructions
#
clear
printf "\nDocker Setup Result"
printf "\n----------------------\n"
sudo docker ps | grep ${CONTAINER_NAME} >/dev/null
if [ $? -ne 0 ];then
    printf "Sorry! Something went wrong. :(\n"
else
    printf "GREAT! Your telegram-get-participants Docker Container is running now! :)\n"
    printf "\nShow your running docker container \'${CONTAINER_NAME}\' with 'docker ps'\n"
    sudo docker ps | grep ${CONTAINER_NAME}
    printf "\nJump inside the docker container with 'docker exec -it ${CONTAINER_NAME} bash'\n"
    printf "HAVE FUN!\n\n"
fi
