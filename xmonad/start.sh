# sets seconds screen #						--   425 (xmonad window overlaps xmobar)
nvidia-settings --assign 'CurrentMetaMode=HDMI-0: 2560x1080_75 +1366+420, DVI-D-0: nvidia-auto-select +0+0' \

# compositor #
picom -b \

# turns on numlock #
numlockx \

# sets cursor size to 28 #
xsetroot -xcf /usr/share/icons/macOSBigSur/cursors/left_ptr 28 \

# background image #
sleep 0.1 && feh --bg-center /usr/share/backgrounds/nord.png  && feh --bg-fill /usr/share/backgrounds/nord.png --window-id 2 \

# conky #
conky -m 1 -d \

# redshift #
DISPLAY=:0 redshift -c ~/.config/redshift/redshift.conf -l -34.9:-58.5 & \

# sets mouse lighting #
rivalcfg --strip-top-color 7488e3 --strip-middle-color 7488e3 --strip-bottom-color 7488e3 -c 002fff && rivalcfg -e breath-fast && rivalcfg -b='buttons(button6=PlayPause)' \

# spawns systray #
sleep 1 && trayer --edge top --monitor 1 --widthtype request --expand true --heighttype pixel --height 18 --align right --transparent true --alpha 0 --tint 0x2E3440 --iconspacing 3 --distance 1 & \

# network manager applet #
nm-applet & \
