#!/bin/bash

theme="card_square"
dir="$HOME/.config/rofi/entries/hue"
rofi_command="rofi -theme $dir/$theme -m 1"

# Options
go=""
hue=""

# Variable passed to rofi
options="$go\n$hue"

chosen="$(echo -e "$options" | $rofi_command -p "Light options: " -dmenu -selected-row 0)"
case $chosen in
    $go)
	/home/tomi/.config/rofi/entries/hue/onoff/OnOff.sh GO
	;;
    $hue)
	/home/tomi/.config/rofi/entries/hue/onoff/OnOff.sh HUE
	env
    ;;
esac
