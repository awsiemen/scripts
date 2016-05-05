#!/bin/bash

# This is just a script to call xrandr to do things based on which
# displays are connected. Used as a hook for an acpi event related
# to docking and undocking my laptop.

if [[ $(xrandr -d :0.0 -q | grep HDMI3 | cut -d " " -f2) = 'disconnected' ]]; then

xrandr -d :0.0 --output HDMI3 --off 
xrandr -d :0.0 --output LVDS1 --auto 
xrandr -d :0.0 --output HDMI2 --off

else

xrandr -d :0.0 --output HDMI3 --auto 
xrandr -d :0.0 --output LVDS1 --off 
sleep 1 # To ensure the displays connect in the right order
xrandr -d :0.0 --output HDMI2 --auto --right-of HDMI3

fi

exit 0
