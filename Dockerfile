# Telegram-Export - Dockerfile (06-2018)
#

# Use an official Python runtime as a parent image
FROM python

LABEL maintainer="David B. (dalijolijo)"
LABEL version="0.1"

# Make ports available to the world outside this container
#EXPOSE 80

USER root

# Change sh to bash
SHELL ["/bin/bash", "-c"]

# Define environment variable
ENV CONFIG "config.ini"
ENV TELEPWD "telegram"

RUN echo '*** Telegram Export ***'

#
# Running updates and installing required packages
#
RUN echo '*** Running updates and installing required packages ***' && \
    apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y  git \
                        ntp \
			python3 \
			python-pip \
                        python-software-properties \
                        sqlite3 \
                        sudo \
                        supervisor \
                        vim \
                        wget

#
# Creating telegram user
#
RUN echo '*** Creating telegram user ***' && \
    adduser --disabled-password --gecos "" telegram && \
    usermod -a -G sudo,telegram telegram && \
    echo telegram:$TELEPWD | chpasswd 

#
# Telegram-export Installation
#
RUN echo '*** Install Pygram and TgCrypto ***' && \
    sudo pip3 install pyrogram && \
    sudo pip3 install TgCrypto

#
# Clone GitHub repository 
#
RUN cd /root/ && \ 
    sudo git clone https://github.com/dalijolijo/telegram-get-participants.git

#
# Copy start.sh and config.ini
#
RUN mkdir -p /usr/local/bin/ && \
    cp /root/telegram-get-participants/start.sh /usr/local/bin/start.sh && \
    rm -f /var/log/access.log && mkfifo -m 0666 /var/log/access.log && \
    chmod 755 /usr/local/bin/*

ENV TERM linux
CMD ["/usr/local/bin/start.sh"]
