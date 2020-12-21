#!/bin/bash

# Low Battery Notification.
# Need: nofify-send, a notifications daemon.
# Set at start up in your init script.

# Messages.
MG1='Conect to charger'
MG2='Battery less than 25%'
# Icon from the system, set you icon path if dosn't display.
ICON=notification-battery-low
# Battery percent warn.
WARN=24
# Rest time.
REST=100

# Loop to notify the battery level.
while true
do
	# Get battery percent and status.
	LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)

	if [ "$LEVEL" -lt $WARN -a "$STATUS" == "Discharging" ];
	 then
		 notify-send -a "Battery" -u critical -i "$ICON" "$MG1" "$MG2"
	fi
sleep $REST
done
