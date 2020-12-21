#!/bin/bash

# Type and copy a selected emoji from a rofi list.
# Require: xclip, rofi, xdotool, notify service and emojis text file.
# To run as Qtile keyblind cp to /bin
# sudo chmod +x ./copymoji.sh
# sudo cp ./copymoji.sh /bin

# Search the list of emojis and print in rofi menu.
chosen=$(cut -d ';' -f1 $HOME/emojis | rofi -dmenu -i | sed "s/ .*//")

# Type the selected emoji if is posible or copy to clipboard.
# Notification will be send if succes.
if [ -n "$1" ]
then 
	xdotool type "$chosen"
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "$chosen is now in the clipboard"
fi 

