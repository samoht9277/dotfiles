#!/bin/bash

isPlaying=$(playerctl -l -s)
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

if [ ! $isPlaying = "" ]; then
    if [ ! "$artist" = "" ]; then
        echo " $artist - $title"
    else
        echo " $title"
    fi
else
    echo " nothing playing."
fi
