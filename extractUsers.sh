#!/bin/bash
#
# extractUsers.sh (by dalijolijo - 05/2018)
#
set -x

# Sync with NTP server
# -> install with: apt-get install ntp
service ntp stop
service ntp start
sleep 10

# Export members of the telegram channel 
# -> install with: apt-get install python3
cd /home/telegram/
python3 get_participants.py > users_all.json

# Extract only first_name, last_name and username
cat users_all.json | grep first_name | tr -d " " | tr -d "," | cut -f 2 -d ":" > first_name.txt
cat users_all.json | grep last_name | tr -d " " | tr -d "," | cut -f 2 -d ":" > last_name.txt
cat users_all.json | grep username | tr -d " " | tr -d "," | cut -f 2 -d ":" > username.txt
paste -d "_" first_name.txt last_name.txt username.txt > userString.txt

# Participants to identified
USER_BEFORE=$(cat userString.txt | wc -l)
printf "Participants (all): $USER_BEFORE \n"
sed -i '/null_null_null/d' userString.txt
USER_AFTER=$(cat userString.txt | wc -l)
printf "Participants (identified): $USER_AFTER \n"
cp userString.txt userString_$(date +%d-%h_%H:%M).txt
