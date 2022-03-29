Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true",
    bgColor = "#1e1e2d",
    fgColor = "#FFFFFF",
	lowerOnStart = True,
	hideOnStart = False,
    position = Static { xpos = 5, ypos = 130, width = 1355, height = 30 },
	alpha = 255,
    commands = [ 
        Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 6000,
        Run Com "/home/tomi/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 1000,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "%UnsafeStdinReader% }{ \
	\<action=`/home/tomi/.config/xmobar/update.sh` button=12345><fc=#fae3b0> %updates%</fc></action>\
    \<fc=#666666> | </fc>\
    \%trayerpad%"
}
