#!/bin/bash
set -u

CONFIG='get_participants.py'

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
wget https://github.com/dalijolijo/telegram-get-participants/raw/master/${CONFIG} --output-document=/tmp/${CONFIG}
chown telegram:telegram /tmp/extractUsers.sh
chown telegram:telegram /tmp/${CONFIG}
chown -R telegram:telegram /home/telegram/
sudo -u telegram cp /tmp/extractUsers.sh /home/telegram/extractUsers.sh
sudo -u telegram cp /tmp/${CONFIG} /home/telegram/${CONFIG}

#
# Set Telegram API developer data
#
sed -i s/API_ID/${API_ID}/g /home/telegram/${CONFIG}
sed -i s/API_HASH/${API_HASH}/g /home/telegram/${CONFIG}
sed -i s/CHANNEL/${CHANNEL}/g /home/telegram/${CONFIG}

#
# Execution of extractUsers script
#
sudo -u telegram +x /home/telegram/extractUsers.sh
sudo -u telegram +x /home/telegram/${CONFIG}
sudo -u telegram /home/telegram/extractUsers.sh

#
# Starting Supervisor Service
#
# Hint: docker not supported systemd, use of supervisord
printf "*** Starting Supervisor Service ***\n"
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
