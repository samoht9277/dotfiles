#!/bin/bash
id="3"

pactl set-source-mute "alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback" toggle

command=$(pactl get-source-mute "alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback" | sed 's/Mute: //g')

if [ $command = "yes" ]; then
    status="muted"
else
    status="unmuted"
fi

dunstify -t 5000 -i /home/tomi/.config/rofi/entries/microphone/"$status".png "Microphone status" "Microphone is now $status." -r "$id"