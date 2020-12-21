#!/bin/bash
# Simple color picker notification.
# Require: colorpicker, xclip, notify-send.
# Get it chmod +x ./copycolor.sh
# To run as Qtile keyblinding:
# sudo cp ./copycolor.sh /usr/local/bin

# Get the color.
COLOR=$(colorpicker --preview --short --one-shot)

# Copy to clipboard and send notification.
if [ -n $COLOR ]
then
	echo "$COLOR" | xclip -selection clipboard
	notify-send "Color: $COLOR" "Copy to clipboard."
fi

