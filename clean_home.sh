#!/bin/bash

# Got tired of stuff piling up in the root of my home directory.
# Simple script to move it all into a temporary folder for processing.
# Cron'd to run every day.

for x in /home/andrew/*; do
if ! [ -d "$x" ];
then
mv -- "$x" /home/andrew/to_sort/
fi
done

exit 0
