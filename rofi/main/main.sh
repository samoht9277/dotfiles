#!/usr/bin/env bash

theme="card_square"
dir="$HOME/.config/rofi/main"

# random colors
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 8 ))]}"

rofi_command="rofi -theme $dir/$theme -m 1"

# Dynamic microphone icon.
if [ $(pactl get-source-mute "alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback" | sed 's/Mute: //g') = "yes" ]; then
    mic=""
else
	mic=""
fi

# Dynamic headphone icon.
if [ ! -z "$(pactl list sinks short | grep Sony)" ]; then
	headphones=""
elif [ ! -z "$(pactl list sinks short | grep bluez)" ]; then
	headphones=""
else
	headphones=""
fi

hue=""
power="襤"

# Variable passed to rofi
options="$hue\n$mic\n$headphones\n$power"

chosen="$(echo -e "$options" | $rofi_command -p "Settings" -dmenu -selected-row 0)"
case $chosen in
    $hue)
	fish -c "/home/tomi/.config/rofi/entries/hue/HUE.sh"
	;;
    $mic)
	/home/tomi/.config/rofi/entries/microphone/microphone.sh
	;;
    $headphones)
	/home/tomi/.config/rofi/entries/output/output.sh
    ;;
	$power)
	/home/tomi/.config/rofi/entries/powermenu/powermenu.sh
	;;
esac
