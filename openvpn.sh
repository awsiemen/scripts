#!/bin/bash

# Script to connect me without password to my work VPN.
# MAKE SURE TO CHMOD THE PASSWD DIRECTORY AND FILE TO go-wrx.

sudo openvpn --config /home/andrew/Downloads/client.ovpn --auth-user-pass /home/andrew/.passwd/ldap &
