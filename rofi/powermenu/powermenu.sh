#!/usr/bin/env bash

theme="card_square"
dir="$HOME/.config/rofi/powermenu"

# random colors
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 8 ))]}"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme -m 1"

shutdown="襤"
reboot="ﰇ"
suspend=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	systemctl poweroff
	;;
    $reboot)
	systemctl reboot
        ;;
    $suspend)
	systemctl suspend
        ;;
esac
