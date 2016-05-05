#!/bin/bash

# Quick and dirty hack to cause resolvconf to check a work DNS server when
# connected to the work VPN.

if [[ $1 == 'home' ]];
then
sudo rm /etc/resolvconf/resolv.conf.d/head
sudo ln -s /etc/resolvconf/resolv.conf.d/head.home /etc/resolvconf/resolv.conf.d/head
elif [[ $1 == 'work' ]];
then
sudo rm /etc/resolvconf/resolv.conf.d/head
sudo ln -s /etc/resolvconf/resolv.conf.d/head.work /etc/resolvconf/resolv.conf.d/head
else
echo "Usage: dns.sh home|work"
exit 1
fi

sudo service resolvconf restart

exit 0
