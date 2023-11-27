#!/usr/bin/env bash

theme="card_square"
dir="$HOME/.config/rofi/entries/output/"
rofi_command="rofi -theme $dir/$theme -m 1"

# Options
wired=""
wireless=""
beats=""

# Variable passed to rofi
options="$wired\n$wireless\n$beats"

chosen="$(echo -e "$options" | $rofi_command -p "Headphone options: " -dmenu -selected-row 0)"
case $chosen in
    $wired)
	/home/tomi/.config/rofi/entries/output/change_output.sh wired
	;;
    $wireless)
	/home/tomi/.config/rofi/entries/output/change_output.sh wireless
    ;;    
    $beats)
	/home/tomi/.config/rofi/entries/output/change_output.sh beats
    ;;
esac
