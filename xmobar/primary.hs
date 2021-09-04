Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true",
    bgColor = "#2E3440",
    fgColor = "#F07178",
    lowerOnStart = False,
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    commands = [ 
	    Run Network "wlp39s0" ["-t", " <rx>  <tx>", "-S", "True"] 10,
        Run Memory ["-t", "  <used>Mb [<usedratio>%]"] 150,
	    Run Com "bash" ["-c", "/home/tomi/code/xmonad/audio/music.sh"] "music" 60,
        Run Com "/home/tomi/code/xmonad/weather/Weather.sh" [] "weather" 6000,
        Run Com "/home/tomi/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 6000,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "%UnsafeStdinReader% }{ \
        \<fc=#6272A4> %music%</fc>\
		\<fc=#666666> | </fc>\
        \<fc=#A3BE8C>%weather%</fc>\
		\<fc=#666666> | </fc>\
		\<fc=#B48EAD>%wlp39s0% </fc>\
        \<fc=#EBCB8B> %memory%</fc>\
		\<fc=#666666> |   </fc>\
        \%trayerpad%"
}