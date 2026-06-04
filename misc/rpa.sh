#!/bin/bash

killall -q pipewire wireplumber pipewire-pulse

while pgrep -u $USER -x "pipewire|wireplumber|pipewire-pulse" >/dev/null; do # Check if pipewire die yet
  sleep 0.1
done
pipewire &
sleep 0.5

wireplumber &
pipewire-pulse &

disown -a

exit 0
