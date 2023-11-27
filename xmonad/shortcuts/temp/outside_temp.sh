#!/bin/bash

temp=$(curl --connect-timeout 5 -s http://192.168.1.$HUE_IP/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/sensors/23/ | jq .state.temperature || :) 

if [ ${#temp} = 4 ]; then
    toCrop=2
elif [ ${#temp} = 3 ]; then
    toCrop=1
else
	echo "n/a"
	exit 0
fi

echo "${temp:0:${toCrop}}°c"
