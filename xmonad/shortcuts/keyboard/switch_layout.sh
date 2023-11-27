#!/bin/bash

id="10"

if [ -z "$(setxkbmap -query | grep altgr-intl)" ]; then
	setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
	lang="Spanish"
else
	setxkbmap -rules evdev -model evdev -layout us
	lang="English"
fi

dunstify "Keyboard" "Language set to $lang" -i "/home/tomi/.xmonad/shortcuts/keyboard/img/img.png" -r "$id"
