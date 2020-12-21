#! /bin/bash

# Apps
#redshift -l 32.23323:11.23322 &
#feh --bg-scale $HOME/bg.jpg &
#picom --experimental-backends &
# Terminal.
alacritty &
# Volume tray and control.
volumeicon &
# Wifi tray and config.
nm-applet &
# Low battery notification.
sh $HOME/plugins/battery-notify.sh &
# PoLe cheat.
#poletg.sh
#copyq &
#deadd-notification-center &
