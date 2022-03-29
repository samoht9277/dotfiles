#!/bin/sh
# Checks if light is either on or off.
id="2"
state=$(curl -sS http://192.168.1.40/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/8/ | jq .state.on)

# Invert the string
if [ $state = "true" ]; then
    state="false"
    onoff="off"
else
    state="true"
    onoff="on"
fi

curl -X PUT http://192.168.1.40/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/8/state -d {'"on"':$state}

dunstify -t 5000 -i /home/tomi/code/xmonad/light/"$onoff".png "Light status" "HUE is now $onoff." -r "$id"