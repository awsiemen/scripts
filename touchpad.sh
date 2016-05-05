#!/bin/bash

# toggle state of my synaptics touchpad (trackpoint 4 lyfe)
# mapped to a shortcut in Awesome for maximum... awesome

tpid=`xinput list | grep SynPS | sed 's/.*id\=\([0-9]\+\).*/\1/g'`

declare -i status
status=`xinput list-props ${tpid} | grep Device\ Enabled | sed -e 's/.*\:[ \t]\+//g'`

if [ 0 -eq ${status} ] ; then
    xinput enable ${tpid}
else
    xinput disable ${tpid}
fi
