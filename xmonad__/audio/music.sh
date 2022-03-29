#!/bin/bash
isPlaying=$(playerctl -l -s)
artist=$(playerctl -s metadata artist)
title=$(playerctl -s metadata title)
out=""

case $(playerctl -s -a metadata title | wc -l) in
	0)
		out="nothing playing."
		;;
	1)
		if [ ! "$artist" = "" ]; then
		    out="$artist - $title"
		else
		    out="$title"
		fi
		;;
	*)
		out="multiple players running."
		;;
esac

if [ ${#out} -gt 50 ]; then
	echo "${out:0:50}..."
else
	echo ${out}
fi