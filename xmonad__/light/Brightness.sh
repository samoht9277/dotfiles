#!/bin/sh

brightness=$(curl -sS http://192.168.1.39/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/8/ | jq .state.bri)
sign=$1

if [ "$sign" = "+" ]; then
    if [ ! "$brightness" -eq 254 ]; then 
        /home/tomi/code/xmonad/light/HUE {'"bri"':"$(($brightness + $2))"}
    fi
elif [ "$sign" = "-" ]; then
    if [ ! "$brightness" -eq 0 ]; then 
        /home/tomi/code/xmonad/light/HUE {'"bri"':"$(($brightness - $2))"}
    fi
fi