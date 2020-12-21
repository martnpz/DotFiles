#!/bin/bash

# Really simple Aliases list from config.fish.
set -e

# List.
printf "\n\tAliases list:\n\n" | \
  lolcat; cat $HOME/.config/fish/config.fish | \
  grep alias | sed 's/alias/    /g' | \
  sed 's/=.*#/\t /g'
