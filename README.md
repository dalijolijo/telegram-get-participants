# telegram-get-participants

With this script you get the first 10.000 users of a telegram chat/channel. It use the Pyrogram Telegram MTProto API Client Library for Python.


## Deploy as a docker container

### Requirements
- Telegram API key: https://docs.pyrogram.ml/start/ProjectSetup#api-keys
- One of the following supported Linux Distribution Versions:
* CentOS 7.4 (x86_64-centos-7)
* Fedora 26 (x86_64-fedora-26)
* Fedora 27 (x86_64-fedora-27)
* Fedora 28 (x86_64-fedora-28)
* Debian 7 (x86_64-debian-wheezy)
* Debian 8 (x86_64-debian-jessie)
* Debian 9 (x86_64-debian-stretch)
* Debian 10 (x86_64-debian-buster)
* Ubuntu 14.04 LTS (x86_64-ubuntu-trusty)
* Ubuntu 16.04 LTS (x86_64-ubuntu-xenial)
* Ubuntu 17.10 (x86_64-ubuntu-artful)
* Ubuntu 18.04 LTS (x86_64-ubuntu-bionic)


### Download and execute the docker-ce installation script

Download and execute the automated docker-ce installation script - maintained by the Docker project.

```
sudo curl -sSL https://get.docker.com | sh
```


### Download and execute the script
Login as root, then do:

```
wget https://github.com/dalijolijo/telegram-get-participants/raw/master/docker-install.sh
chmod +x docker-install.sh
./docker-install.sh
```
You will be asked for a new `telegram` user password, for your `Telegram API ID`, for your `Telegram API ID Hash` and for the Telegram Channel/Chat from which you want to export user data.


### Get channel participants


Execute `extractUsers.sh` script to get channel participants:

```
cd /home/telegram/
./extractUsers.sh
```
You will be asked for your `PHONE NUMBER` and a registration code will be send to your phone.


### Find results
You will find the result file `userString_<date>.txt` in the directory `/home/telegram/`.


## Ressources
Forked from https://github.com/pyrogram/pyrogram/blob/develop/examples/get_participants.py


#### Pyrogram - Telegram MTProto API Client Library for Python
- Source Code: https://github.com/pyrogram
- API Docu: https://docs.pyrogram.ml/


## Copyright & License
Licensed under the terms of the `GNU Lesser General Public License v3 or later (LGPLv3+)`
