Config { 
    font = "SF Mono Bold 12",
    additionalFonts = ["UbuntuMono Nerd Font Bold 14"],
    bgColor = "#1e1e2d",
    alpha = 125,
    fgColor = "#ffffff",
    position = Static { xpos = 1395, ypos = 10, width = 2500, height = 25 },
    commands = [ 
        Run DynNetwork ["-t", " <rx>  <tx>", "-S", "True"] 10,
        Run Com "bash" ["-c", "/home/tomi/.xmonad/shortcuts/audio/music.sh"] "music" 60,
        Run UnsafeStdinReader,
        Run Date "%d/%m" "date" 36000, 
        Run Date "%I:%M:%S %p" "time" 10, 
        Run Com "fish" ["-c", "/home/tomi/.xmonad/shortcuts/temp/outside_temp.sh"] "temperature" 900,
        Run Com "fish" ["-c", "/home/tomi/.xmonad/shortcuts/temp/outside_cond.sh"] "condition" 900
    ],
    alignSep = "}{",
    template = " <fc=#fae3b0>%music%</fc>\
    \<fc=#dbdbdb> | </fc>\
    \<fc=#f5c2e7>%dynnetwork%</fc>\
    \ } <fn=1>%UnsafeStdinReader% </fn> { \
    \<fc=#b5e8e0>%condition%</fc>\
    \<fc=#dbdbdb> | </fc>\
    \<fc=#a6da95>%temperature%</fc>\
    \<fc=#dbdbdb> | </fc>\
    \<fc=#8aadf4>%date%</fc>\
    \<fc=#dbdbdb> | </fc>\
    \<fc=#ed8796>%time%</fc> "
}
