#!/bin/bash
set -u

#
# Set passwd of telegram user
#
echo telegram:${TELEPWD} | chpasswd
mkdir -p /home/telegram/
chown -R telegram:telegram /home/telegram

#
# Downloading extractUsers.sh and get_participants.py
#
cd /tmp/
wget https://github.com/dalijolijo/telegram-get-participants/raw/master/extractUsers.sh --output-document=/tmp/extractUsers.sh
wget https://github.com/dalijolijo/telegram-get-participants/raw/master/get_participants.py --output-document=/tmp/get_participants.py
chown telegram:telegram /tmp/extractUsers.sh
chown telegram:telegram /tmp/get_participants.py
chown -R telegram:telegram /home/telegram/
sudo -u telegram cp /tmp/extractUsers.sh /home/telegram/extractUsers.sh
sudo -u telegram cp /tmp/get_participants.py /home/telegram/get_participants.py

#
# Set Telegram API developer data
#
sed -i s/API_ID/${API_ID}/g /home/telegram/get_participants.py
sed -i s/API_HASH/${API_HASH}/g /home/telegram/get_participants.py
sed -i s/CHANNEL/${CHANNEL}/g /home/telegram/get_participants.py

#
# Execution of extractUsers script
#
sudo -u telegram +x /home/telegram/extractUsers.sh
sudo -u telegram +x /home/telegram/get_participants.py
sudo -u telegram /home/telegram/extractUsers.sh

#
# Starting Supervisor Service
#
# Hint: docker not supported systemd, use of supervisord
printf "*** Starting Supervisor Service ***\n"
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
