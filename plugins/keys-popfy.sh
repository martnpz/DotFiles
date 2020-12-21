#!/bin/bash
# Require lemonbar-xft-git from AUR and Hack NF.
# Give it chmod +x ./keys-popfy.sh
# cp to execuables folder:
# sudo cp ./keys-popfy.sh /usr/local/bin

#---- Preparation ----#
# Popfy config.
BG=#90011627
FG=#ffffff
geometry=80x80+640+620
icon="[-]"

# Hide the previous notification.
#function close() {
#	for wid in $(xdotool search --classname lemonbar)
#	do
#		 xdotool windowunmap $wid
#	done
#}

# Summon Popfy.
function popfy() {
	killall lemonbar
	echo -e ${1} | lemonbar -p \
							-d \
							-n Popfy \
							-g $geometry \
							-B$BG \
							-f "Hack Nerd Font"-30 \
							-F$FG &
#	Close after 1 seconds.
	sleep 2; killall lemonbar
}

# Mods status variables.
CAPS=$(xset q | grep -oE "Caps Lock:.*01" | grep -Eiw "off|on" \
		 | awk '{ gsub("","",$1); print $3}')
NUM=$(xset q | grep -oE "Num Lock:.*02" | grep -Eiw "off|on" \
		 | awk '{ gsub("","",$1); print $3}')
MUTE=$(amixer get Master | grep Left | grep -oE '[^ ]+$' \
		 | grep -oE "off|on")

# Caps_Lock pop up function
caps_pop() {
	if [ "$CAPS" == "on" ]; then
		popfy "\u200C 了"
	elif [ "$CAPS" == "off" ]; then
		popfy "\u200C "
	fi
}

# Num_Lock pop up function. 
function num_pop() {
	if [ "$NUM" == "off" ]; then
		popfy "\u200C 藺"
	elif [ "$NUM" == "on" ]; then
		popfy "\u200C 璘"
	fi
}

# Mute pop up function.
function mute_pop() {
	if [ "$MUTE" == "off" ]; then
		popfy "\u200C 墳"
	elif [ "$MUTE" == "on" ]; then
		popfy "\u200C 婢"
	fi
}

# Parameters for spawn.



if [[ $1 == caps ]]; then
	xdotool key Caps_Lock
	caps_pop
elif [[ $1 == num ]]; then
	xdotool key Num_Lock
	num_pop
elif [[ $1 == mute ]]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	mute_pop
else
	notify-send -a "Popfy" "Invalid params." \
					"Expected: caps, num or mute."
fi

