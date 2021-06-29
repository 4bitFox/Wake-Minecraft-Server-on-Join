#!/bin/sh

### SETTINGS ###
 # MAC of PC to be woken.
MAC=XX:XX:XX:XX:XX:XX
 # Path to latest.log
LOG=~/PathToServer/logs/latest.log
 # String that triggers the WoL command. (This should be fine if you use Bungeecord or Waterfall.)
TRIGGER=connected
 # How long to wait between each check in seconds.
T0=0.5
 # How long to wait after waking real server in seconds.
T1=300


while :
do
# Detect if someone joined (or left if you use connected as trigger, but that dun't matter :P).
if tail -1 $LOG | grep -q $TRIGGER
then
    echo "Sending wake signal to $MAC..." >> $LOG # This line just for preventing grep to detect the previous line in latest-log and spamming the WoL command.
# Wake server.
    ## If you use wol (Arch Repo)##
    #wol $MAC
    ## If you use wakeonlan (Debian Repo) ##
    wakeonlan $MAC
    ## If you use NetCat ## => https://stackoverflow.com/questions/31588035/bash-one-line-command-to-send-wake-on-lan-magic-packet-without-specific-tool
    #echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo $MAC | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b 255.255.255.255 4000
    echo "Sent Wake on Lan signal to $MAC"
    sleep $T1
else
sleep $T0
fi
done

## Tips:
# Run the script after server generates new latest.log if you have problems. (e.g. "sleep 5")
# Change "fallback_kick" in messages.properties to inform the player to reconnect in a moment. (messages.properties is located in the Bungeecord or Waterfall JAR.)
# You can use "jar uf waterfall-*.jar messages.properties" to inject the file.

## On the main server machine:
# You can use crontab to launch the server on boot.
# To turn the server off again, I used this plugin: https://www.spigotmc.org/resources/autostop.72557/
# Put the command "poweroff" at the bottom of your servers start script. This will make it... power off (obviously :D).



