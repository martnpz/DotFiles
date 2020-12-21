#!/bin/bash

# Really simple CPU & RAM usage porcesses viewer.
# Give it chmod and cp to /usr/local/bin.

# Number of porcesses that will be showed.
input=""
if [ "$1" ]; then
   input="$1"
 else
   input=10
fi

# Print processes.
# '\e[31m' is the color of the text, can be 30-37 or 40-47.
echo -e '\e[31mCPU%\e[0m\t \e[33mRAM MB\e[0m\t \e[36mPROCESS:\e[0m' & \
  ps aux | sort -nrk 3,3 | head -n $input | \
awk '{print $3, $4 * 7871 / 100, $11}' | \
awk '{printf "%.1f \t %.0f \t %s\n", $1, $2, $3}' | \
sed 's/\/.*\///g' | \
sed 's/%.*//g'
