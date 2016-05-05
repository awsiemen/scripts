#!/bin/bash

# Wrapper script to offlineimap to interface it with libnotify to let me know
# when I have new mail. Cron'd to run every 15 minutes.

#run OfflineIMAP once, with quiet interface
#/home/andrew/scripts/offlineimap_wrapper.sh -o -q -u quiet
#/home/andrew/scripts/offlineimap_wrapper.sh "$@" | tee /home/andrew/offlineimap.log

source /home/andrew/.gpg-agent-info && echo "NEW RUN: sourced gpg-agent-info. Proof: $GPG_AGENT_INFO" >> /home/andrew/offlineimap.log
export GPG_AGENT_INFO && echo "Successfully exported environment variable." >> /home/andrew/offlineimap.log
/usr/local/bin/offlineimap "$@" | tee -a /home/andrew/offlineimap.log && echo "Ran the thing.\n" >> /home/andrew/offlineimap.log


#count new and old mail for gmail
mdngmail="$HOME/mail/gmail-pers/INBOX/new/"
ngmail="$(find $mdngmail -type f | wc -l)"
mdogmail="$HOME/mail/gmail-pers/INBOX/cur/"
ogmail="$(find $mdogmail -type f | wc -l)"

#count new and old mail for mtu
mdnmtu="$HOME/mail/mtu/INBOX/new/"
nmtu="$(find $mdnmtu -type f | wc -l)"
mdomtu="$HOME/mail/mtu/INBOX/cur/"
omtu="$(find $mdomtu -type f | wc -l)"

#count new and old mail for work
mdnwork="$HOME/mail/work/INBOX/new/"
nwork="$(find $mdnwork -type f | wc -l)"
mdowork="$HOME/mail/work/INBOX/cur/"
owork="$(find $mdowork -type f | wc -l)"

#count new and old mail for pers
mdnpers="$HOME/mail/pers/INBOX/new/"
npers="$(find $mdnpers -type f | wc -l)"
mdopers="$HOME/mail/pers/INBOX/cur/"
opers="$(find $mdopers -type f | wc -l)"

if [ $ngmail -gt 0 -o $nmtu -gt 0 -o $nwork -gt 0 -o $npers -gt 0 ] 
then
    export DISPLAY=:0; export XAUTHORITY=~/.Xauthority; 
    notify-send "            OfflineIMAP            " "New mail!\n\n\n\nPersonal:$ngmail\nMTU:$nmtu\nWork:$nwork\nPers:$npers"
fi
