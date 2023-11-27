#!/bin/sh

if [[ $( playerctl -l) == *"spotify"* ]]; then
	playerctl -p spotify play-pause
else
	playerctl play-pause
fi