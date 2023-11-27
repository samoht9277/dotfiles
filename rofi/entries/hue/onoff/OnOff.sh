#!/bin/bash

# Checks if light is either on or off.
id="2"

# Bridge API light code.
if [ $1 = "HUE" ]; then
	light_num=8
else
	light_num=4
fi

str="http://192.168.1.$HUE_IP/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/$light_num"

state=$(curl -sS $str | jq .state.on)

# Invert the string
if [ $state = "true" ]; then
    onoff="off"
    state="false"
else

    onoff="on"
    state="true"
fi
curl -X PUT $str/state/ -d {'"on"':$state}

dunstify -t 5000 -i /home/tomi/.config/rofi/entries/hue/onoff/"$onoff".png "Light status" "$1 is now $onoff." -r "$id"