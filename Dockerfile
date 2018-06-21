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
    apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install pyrogram && \
    pip3 install TgCrypto

#
# Copy start.sh
#
RUN wget https://github.com/dalijolijo/telegram-get-participants/blob/master/start.sh --output-document=/root/start.sh
RUN mkdir -p /usr/local/bin/ && \
    cp /root/start.sh /usr/local/bin/start.sh && \
    rm -f /var/log/access.log && mkfifo -m 0666 /var/log/access.log && \
    chmod 755 /usr/local/bin/*

ENV TERM linux
CMD ["/usr/local/bin/start.sh"]
