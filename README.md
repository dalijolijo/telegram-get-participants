# telegram-get-participants

With this script you get the first 10.000 users of a telegram chat/channel. It use the Pyrogram Telegram MTProto API Client Library for Python.

## OPTION 1: Installation with script 

### Requirements
- Ubuntu 16.04  
- Python 3.4 or higher.
- Telegram API key: https://docs.pyrogram.ml/start/ProjectSetup#api-keys

### Installing

```
apt-get install python-software-properties python3 ntp git
pip3 install pyrogram
pip3 install TgCrypto
```

### Get channel participants

```
git clone https://github.com/dalijolijo/telegram-get-participants.git
cd telegram telegram-get-participants
```

Change `api_id`and `api_hash` in `get_participants.py`
```
app = Client(
    session_name="my_account",
    api_id=123456,
    api_hash="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

Change channel/chat name in `get_participants.py` (important: you need admin rights for this channel/chat)
```
target = "coin_analyse"
```

Execute `extractUsers.sh` bash script

```
chmod 755 extractUsers.sh
./extractUsers.sh
```

## OPTION 2: Deploy as a docker container

Support for the following distribution versions:
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

### Find results
Find the results file `userString_<date>.txt`in `/home/telegram/`

## Ressources
Forked from https://github.com/pyrogram/pyrogram/blob/develop/examples/get_participants.py
#### Pyrogram - Telegram MTProto API Client Library for Python
- Source Code: https://github.com/pyrogram
- API Docu: https://docs.pyrogram.ml/


## Copyright & License
Licensed under the terms of the `GNU Lesser General Public License v3 or later (LGPLv3+)`
