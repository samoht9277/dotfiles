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
	if [ $(stat -c%s "$file") = "0" ]; then
		exit 0
	fi
	# Image to clipboard.
	dunstify 'Screenshot taken!' 'Image has been saved to the clipboard.' --icon=$file -r $id
	sleep 1
	rm $file
else
	# Image saved to disk.
	dunstify 'Screenshot taken!' 'Image has been saved to the ~/Downloads directory.' --icon=$file -r $id
fi