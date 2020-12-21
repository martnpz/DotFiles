#!/bin/bash

# To works with keyblind in Qtile
# cp to /bin folder
# sudo cp ./notification_center.sh /bin

kill -s USR1 $(pidof deadd-notification-center)
