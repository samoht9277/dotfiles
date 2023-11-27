#!/usr/bin/xdotool

sleep 0.5 search --onlyvisible --classname $1 set_desktop_for_window %1 $2
