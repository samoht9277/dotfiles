#!/bin/sh

id="1"

if [ $1 = "volume" ]; then
	pulseaudio-ctl "$2" 5
	current="$(pamixer --get-volume)"
	if [ $( pamixer --get-mute) = "true" ]; then
		muted="[muted]"
	fi
	dunstify "Volume status" "Volume at ${current}% ${muted}" -h int:value:${current} -t 2000 -i ~/code/xmonad/audio/img/"$(percentage ${current} 1 2 3 4)".png -r "$id"
elif [ $1 = "mute" ]; then
	if [ $( pamixer --get-mute) = "false" ]; then
		state="muted"
	else
		state="unmuted"
	fi
	pulseaudio-ctl mute
	dunstify "Volume status" "Volume ${state}" -t 1000 --icon ~/code/xmonad/audio/img/"$state".png -r "$id"
else
	exit 0
fi
