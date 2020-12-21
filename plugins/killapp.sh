#!/bin/bash

# Simple kill process app.
# Require rofi.
# Give it chmod +x ./killapp.sh and
# sudo cp ./killapp.sh /bin

# Seach the process.
app=$(ps -e | awk '{gsub(/[0-9?A-Z:\/]|\s|(^|\s)tty|pts/, ""); print}' | cat | rofi -dmenu -i)

# If app is set, kill the process and send notification.
if [ $app ]
then
   	killall $app
   	notify-send -a "Killapp" -i process-stop "$app" "Process end."
fi
