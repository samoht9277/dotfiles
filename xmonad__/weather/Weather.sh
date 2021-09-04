#!/bin/sh

temp=$(curl -s http://192.168.1.39/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/sensors/23/ | jq .state.temperature)

if [ ${#temp} = 4 ]; then
    toCrop=2
else
    toCrop=1
fi

echo ${temp:0:${toCrop}}°c