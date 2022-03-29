#!/bin/bash

id="4"

if [ ! -d /tmp/screenshot/ ]; then
	mkdir /tmp/screenshot/
fi

if [[ $1 = "crop" ]]; then
	file=/tmp/screenshot/clipboard.webp
	maim --noopengl -m 10 -s -q -u | xclip -selection c -t image/png -i -f > $file
else
	file=~/Downloads/$(date +%s).webp
	maim -m 10 $file
fi

if [ -f /tmp/screenshot/clipboard.webp ]; then
	if [ ! $(stat -c%s "$file") = "0" ]; then
		ACTION=$(dunstify 'Screenshot taken!' 'Image saved to the clipboard.' --action="default, test" --icon=$file -r $id)
		case "$ACTION" in
		"default")
			feh $file
			;;
		esac	
	fi
	# Image to clipboard.
	sleep 1
	rm $file
else
	# Image saved to disk.
	dunstify 'Screenshot taken!' 'Image saved on ~/Downloads.' --icon=$file -r $id
fi