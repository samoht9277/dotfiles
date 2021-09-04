Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true",
    bgColor = "#2E3440",
    fgColor = "#f07178",
    lowerOnStart = False, -- True
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    commands = [ 
        Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 6000,
        Run Date "%d/%m" "date" 60000,
        Run Com "bash" ["-c", "date +'%I:%M %p'"] "time" 600,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "%UnsafeStdinReader% }{ \
	\<fc=#B48EAD> %updates%</fc>\
	\<fc=#666666> | </fc>\
	\<fc=#B287D4> %date%</fc>\
	\<fc=#666666> | </fc>\
	\<fc=#8BE9FD> %time%  </fc>"
}
