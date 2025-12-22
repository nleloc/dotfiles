#!/bin/bash

killall -q qs quickshell

while pgrep -u $USER -x "qs|quickshell" >/dev/null; do # Check if quickshell die yet
  sleep 0.2
done
qs -c caelestia &
disown

exit
