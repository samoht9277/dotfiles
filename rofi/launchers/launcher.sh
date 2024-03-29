#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6     style_7

theme="style_2"

dir="$HOME/.config/rofi/launchers/"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"

rofi -m 1 -no-lazy-grab -show drun -modi run,drun,window -drun-display-format {name} -theme $dir/"$theme"