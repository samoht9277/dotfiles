#!/bin/sh
# Checks if light is either on or off.
id="2"
state=$(curl -sS http://192.168.1.39/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/8/ | jq .state.on)

# Invert the string
if [ "$state" = "false" ]; then
    status="true"
else
    status="false"
fi

# Call binary.
/home/tomi/code/xmonad/light/HUE {'"on"':"$status"}

# Send notification.

if [ "$state" = "false" ]; then
    onoff="on"
else
    onoff="off"
fi

dunstify -t 5000 -i /home/tomi/code/xmonad/light/"$onoff".png "Light status" "HUE is now $onoff." -r "$id"