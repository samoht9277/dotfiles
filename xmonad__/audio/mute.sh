#!/bin/sh

id="1"

if [ $( pamixer --get-mute) = "false" ]; then
	state="muted"
	current=0
else
	state="unmuted"
	current="$(pamixer --get-volume)"
fi
pulseaudio-ctl mute
dunstify "Volume status" "Volume ${state}" -h int:value:${current} -t 1000 --icon ~/code/xmonad/audio/img/"$state".png -r "$id"