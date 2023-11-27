# compositor #
picom -b & \

# turns on numlock #
numlockx & \

# notification daemon #
dunst & \

# sets cursor size to 28 #
xsetroot -xcf /usr/share/themes/macOSBigSur/cursors/left_ptr 28 & \

# redshift #
DISPLAY=:0 redshift -c ~/.config/redshift/redshift.conf -l -34.9:-58.5 & \

# sets mouse lighting #
~/.local/bin/rivalcfg -e rainbow-shift & \

# conky #
conky -m 1 -d & \

# spawns systray #
trayer --edge top --align right --distance 10 --distancefrom right --widthtype request --expand true --heighttype pixel --height 17 --transparent true --alpha 0 --tint 0x343547 --iconspacing 5
