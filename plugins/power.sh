#!/bin/bash

# Give it exec priviledge, or chmod +x /path/to/power.sh
# For run as Qtile keyblind cp to /bin
# sudo cp /path/of/power.sh /bin

chosen=$(echo -e " Logout\n Shutdown\n Reboot\n Suspend\n" | rofi -dmenu -i)

if [[ $chosen = " Logout" ]]; then
	qtile-cmd -o cmd -f shutdown
elif [[ $chosen = " Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = " Reboot" ]]; then
	systemctl reboot
elif [[ $chosen = " Suspend" ]]; then
	systemctl suspend
fi
