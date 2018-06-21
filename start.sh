#!/bin/bash
set -u

#
# Set passwd of telegram user
#
echo telegram:${TELEPWD} | chpasswd
sudo mkdir -p /home/telegram/
sudo chown -R telegram:telegram /home/telegram

#
# Downloading extractUsers.sh and get_participants.py
#
cd /tmp/
sudo wget https://github.com/dalijolijo/telegram-get-participants/raw/master/extractUsers.sh --output-document=/tmp/extractUsers.sh
sudo wget https://github.com/dalijolijo/telegram-get-participants/raw/master/get_participants.py --output-document=/tmp/get_participants.py
sudo chown telegram:telegram /tmp/extractUsers.sh
sudo chown telegram:telegram /tmp/get_participants.py
sudo chown -R telegram:telegram /home/telegram/
sudo cp /tmp/extractUsers.sh /home/telegram/extractUsers.sh
sudo cp /tmp/get_participants.py /home/telegram/get_participants.py

#
# Set Telegram API developer data
#
sed -i s/API_ID/${API_ID}/g /home/telegram/get_participants.py
sed -i s/API_HASH/${API_HASH}/g /home/telegram/get_participants.py
sed -i s/CHANNEL/${CHANNEL}/g /home/telegram/get_participants.py

#
# Execution of extractUsers script
#
sudo chmod +x /home/telegram/extractUsers.sh
sudo chmod +x /home/telegram/get_participants.py

#
# Starting Supervisor Service
#
# Hint: docker not supported systemd, use of supervisord
printf "*** Starting Supervisor Service ***\n"
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
