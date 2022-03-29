# compositor #
picom -b & \

# turns on numlock #
numlockx & \

# notification daemon #
dunst & \

# sets cursor size to 28 #
xsetroot -xcf /usr/share/themes/macOSBigSur/cursors/left_ptr 28 & \

# background image #
/home/tomi/code/xmonad/screen/wallpaper.sh & \

# conky #
conky -m 1 -d & \

# redshift #
DISPLAY=:0 redshift -c ~/.config/redshift/redshift.conf -l -34.9:-58.5 & \

# sets mouse lighting #
rivalcfg -e rainbow-shift

# spawns systray #
sleep 10 && trayer --edge top --align right --distance 10 --distancefrom right --widthtype request --expand true --heighttype pixel --height 18 --transparent true --alpha 0 --tint 0x1E1E2D --iconspacing 5trayer