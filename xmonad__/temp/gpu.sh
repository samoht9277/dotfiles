#!/bin/sh
if [[ $1 = "util" ]]; then
	echo $(nvidia-settings --q GPUUtilization -t | awk -v FS="(graphics=|, memory)" '{print $2}')% | tr "" " "
else
	echo $(nvidia-settings --q GPUCoreTemp -t | head -n 1)
fi