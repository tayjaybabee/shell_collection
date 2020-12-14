#!/bin/bash

# while-menu: a menu-driven system information program

DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit

_EOF_

  read -p "Enter selection [0-3] > "

  if [[ $REPLY =~ ^[0-3]$ ]]; then
    case $REPLY in
      1)
        echo "Hostname: $HOSTNAME"
        uptime
        sleep $DELAY
        continue
        ;;
      2)
        df -h
        sleep $DELAY
        continue
        ;;
      3)
        if [[ $(id -u) -eq 0 ]]; then
          echo "Home Space Utilization (All Users)"
          du -sh /home/* 2> /dev/null
        else
          echo "Home Space Utilization ($USER)"
          du -sh $HOME 2> /dev/null
        fi
        sleep $DELAY
        continue
        ;;
      0)
        break
        ;;
    esac
  else
    echo "Invalid entry."
    sleep $DELAY
  fi
done
echo "Program terminated."

