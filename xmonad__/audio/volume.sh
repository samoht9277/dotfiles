#!/bin/sh

id="1"

pulseaudio-ctl "$1" 5
current="$(pamixer --get-volume)"
if [ $( pamixer --get-mute) = "true" ]; then
	muted="[muted]"
fi

dunstify "Volume status" "Volume at ${current}% ${muted}" -h int:value:${current} -t 2000 -i ~/code/xmonad/audio/img/"$(~/.local/bin/percentage ${current} 1 2 3 4)".png -r "$id"