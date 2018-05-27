# telegram-get-participants

With this script you get the first 10.000 users of a telegram chat/channel. The get_participants.py is part of Pyrogram - Telegram MTProto API Client Library for Python.

## Requirements
- Ubuntu 16.04  
- Python 3.4 or higher.
- Telegram API key: https://docs.pyrogram.ml/start/ProjectSetup#api-keys

## Installing

```
apt-get install python-software-properties python3 ntp git
pip3 install pyrogram
pip3 install TgCrypto
```

## Get channel participants

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
Execute `extractUsers.sh` bash script

```
chmod 755 extractUsers.sh
./extractUsers.sh
```

## Ressources
Forked from https://github.com/pyrogram/pyrogram/blob/develop/examples/get_participants.py
#### Pyrogram - Telegram MTProto API Client Library for Python
- Source Code: https://github.com/pyrogram
- API Docu: https://docs.pyrogram.ml/


## Copyright & License
Licensed under the terms of the `GNU Lesser General Public License v3 or later (LGPLv3+)`
