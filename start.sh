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
# Set Telegram API developer data
#
sed -i s/API_ID/${API_ID}/g /root/telegram-get-participants/${CONFIG}
sed -i s/API_HASH/${API_HASH}/g /root/telegram-get-participants/${CONFIG}
sed -i s/CHANNEL/${CHANNEL}/g /root/telegram-get-participants/${CONFIG}

#
# Execution of extractUsers script
#
/root/telegram-get-participants/
chmod 755 extractUsers.sh
./extractUsers.sh

#
# Starting Supervisor Service
#
# Hint: docker not supported systemd, use of supervisord
printf "*** Starting Supervisor Service ***\n"
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
