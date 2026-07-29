#!/bin/bash

killall -q qs quickshell wlsunset

# check if quickshell and its shit die yet
while pgrep -u $USER -x "qs|quickshell|wlsunset" >/dev/null; do
  sleep 0.2
done
qs -c noctalia-shell &
disown

exit 0
