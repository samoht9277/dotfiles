Config { 
    font = "SF Mono Bold 12",
    bgColor = "#1e1e2d",
    fgColor = "#FFFFFF",
    lowerOnStart = True,
    hideOnStart = False,
    position = Static { xpos = 5, ypos = 130, width = 1355, height = 30 },
    alpha = 125,
    commands = [ 
        Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 6000,
        Run Com "/home/tomi/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 500,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "%UnsafeStdinReader% }{ <action=/home/tomi/.config/xmobar/update.sh button=12345><fc=#abe9b3> %updates%</fc></action><fc=#dbdbdb> | </fc>%trayerpad%"
}
