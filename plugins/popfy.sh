#!/bin/bash
# Simple brightness and volume pop up.
# Require lemonbar-xft-git from AUR repositories and Hack NF.
# Give it chmod +x ./popfy.sh
# To works as Qtile keyblindig:
# sudo cp popfy.sh /usr/local/bin

#---- Data ----#
# Get the brightness percent and divide by 5 for short result.
brightness=`expr $(xbacklight | sed "s/[.].*//") / 5`
# Get the volume percent and do the same operation.
volume=`expr $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)\
			| sed "s/%//") / 5`
# Get the volume status if is 'off'.
mute=$(amixer get Master | grep Left | grep -oE '[^ ]+$' | grep off)

#---- Config ----#
# Background color Alpha, HEX or RGB.
BG=#011627
# Font color.
FG=#17cf65
# Bar geometry WxH+X+Y. Tested in 1366x768 monitor.
geometry=335x45+515+620

# First character.
first=""
# Progres bar.
body=""
# Last character.
last=""

#---- Preparation ----#
# Close the previous process.
for wid in $(xdotool search --classname lemonbar)
do
	 xdotool windowunmap $wid
done
#killall lemonbar
# Parameter: brightness.
if [ "$1" == "brightness" ]
then
	 # Glyp from Nerd Font.
	 icon="\u200C 盛"
	 # Multiply the character (bar) according to the percent.
	 # $brightness is how many times will be repeat.
	 progress=$(printf "%${brightness}s")
# Parameter: volume.
elif [ "$1" == "volume" ]
then
	 icon="\u200C 墳"
	 progress=$(printf "%${volume}s")
	 # Is volume off?
	if [ $mute ]
	then
	   icon="\u200C 婢"
	   FG=#4a6670
	fi
else
	 first=""
	 body=""
	 FG=#f0803c
	 last=""
	 progress=$(printf "Invalid_params.")
	 notify-send -a "Popfy" -u critical "Invalid params."\
										"Expected 'brightness' or 'volume'."
fi

# Parameter: volume level.
if [ "$2" == "up" ]
then
	 pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$2" == "down" ]
then 
	 pactl set-sink-volume @DEFAULT_SINK@ -5%
fi

# Print the icon, first character, the bar and the last character.
bar=$(printf " $icon $first${progress// /$body}$last")

#----PopUp ----#
echo -e ${bar} | lemonbar -p\
							-d\
							-n Popfy\
							-g $geometry\
							-B$BG\
							-f "Hack Nerd Font"-16\
							-F$FG &
# Close after 1 seconds.
sleep 1; killall lemonbar

