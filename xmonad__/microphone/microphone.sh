#!/bin/bash

id="3"
command=$(pulseaudio-ctl full-status)
array=($command)

pulseaudio-ctl mute-input

if [ ${array[2]} = "no" ]; then
    status="muted"
else
    status="unmuted"
fi

dunstify -t 5000 -i /home/tomi/code/xmonad/microphone/"$status".png "Microphone status" "Microphone is now $status." -r "$id"