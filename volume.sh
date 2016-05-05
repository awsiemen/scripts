#!/bin/bash

# Script to change my PulseAudio volume. Mapped to keyboard shortcuts in Awesome.

if [ $# -ne 1 ]
then
  echo 'Usage: volume.sh [up|down]'
  exit 1
fi

sinks=`pacmd list-sinks | grep index | sed 's/.*://'`

for i in $sinks
do
  if [ $1 = "up" ]
  then
    `pactl set-sink-volume $i -- +5%`
  elif [ $1 = "down" ]
  then
    `pactl set-sink-volume $i -- -5%`
  else
    echo 'Operation not supported'
    exit 1
  fi
done

exit 0
