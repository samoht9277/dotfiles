Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true",
    additionalFonts = ["xft:UbuntuMono Nerd Font:weight=regular:pixelsize=20:antialias=true:hinting=true"]
    bgColor = "#1e1e2d",
    alpha = 255,
    fgColor = "#ffffff",
    position = Static { xpos = 1395, ypos = 5, width = 2500, height = 25 },
    commands = [ 
        Run DynNetwork ["-t", " <rx>  <tx>", "-S", "True"] 10,
        Run Com "bash" ["-c", "/home/tomi/code/xmonad/audio/music.sh"] "music" 60,
        Run UnsafeStdinReader,
        Run Date "%d/%m" "date" 36000, 
        Run Date "%I:%M:%S %p" "time" 10, 
        Run Com "bash" ["-c", "/home/tomi/code/xmonad/weather/Weather.sh"] "weather" 900
    ],
    alignSep = "}{",
    template = "  <fc=#fae3b0><fn=1></fn> %music%</fc>\
    \<fc=#666666> | </fc>\
    \<fc=#f5c2e7>%dynnetwork%</fc>\
    \ } %UnsafeStdinReader% { \
    \<fc=#abe9b3><fn=1>﨎</fn> %weather%</fc>\
    \<fc=#666666> | </fc>\
    \<fc=#89dceb><fn=1> </fn>%date%</fc>\
    \<fc=#666666> | </fc>\
    \<fc=#f28fad><fn=1> </fn>%time%</fc>  "
}