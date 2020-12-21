#!/bin/bash

size=335x45+500+620
BG=#70000000
font="Hack Nerd Font"-16
FG=#17D065


./popfy.sh | lemonbar -p -d -g $size -B$BG -f $font -F$FG
