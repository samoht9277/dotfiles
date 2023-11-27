#!/usr/bin/env bash

theme="card_square"
dir="$HOME/.config/rofi/entries/powermenu"
rofi_command="rofi -theme $dir/$theme -m 1"

# Options
shutdown="襤"
reboot="ﰇ"
suspend=""
lock=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $(uptime -p | sed -e 's/up //g')" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	systemctl poweroff
	;;
    $reboot)
	systemctl reboot
        ;;
    $suspend)
	dm-tool switch-to-greeter && systemctl suspend
        ;;
	$lock)
	dm-tool switch-to-greeter
		;;
esac
