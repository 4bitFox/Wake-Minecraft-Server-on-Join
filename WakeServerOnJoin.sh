#!/bin/sh

### SETTINGS ###
 # MAC of PC to be woken.
MAC=XX:XX:XX:XX:XX:XX
 # Path to latest.log
LOG=~/Servers/Waterfall/logs/latest.log
 # String that triggers the WoL command. (This should be fine if you use Bungeecord or Waterfall. If you are running a regular server use "joined" or something else instead)
TRIGGER=connected


while :
do
# Detect if someone joined (or left if you use connected as trigger, but that dun't matter :P).
if tail -1 $LOG | grep -q $TRIGGER; then
    echo "Sending wake signal to $MAC..." >> $LOG # This line just for preventing grep to detect the previous line in latest-log and spamming the WoL command.
# Wake server.
    ## If you use wol (Arch Repo)##
    #wol $MAC
    ## If you use wakeonlan (Debian Repo) ##
    wakeonlan $MAC
    ## If you use NetCat ## => https://stackoverflow.com/questions/31588035/bash-one-line-command-to-send-wake-on-lan-magic-packet-without-specific-tool
    #echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo $MAC | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b 255.255.255.255 4000
    echo "Sent Wake on Lan signal to $MAC"
fi
done

## Tips:
# Run the script after server generates new latest.log if you have problems. (e.g. "sleep 5")

## On the main server machine:
# You can use crontab to launch the server on boot.
# To turn the server off again, I used this plugin: https://www.spigotmc.org/resources/autostop.72557/
# Put the command "poweroff" at the bottom of your servers start script. This will make it... power off (obviously :D).



