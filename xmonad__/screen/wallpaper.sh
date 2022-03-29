file=$(ls /usr/share/backgrounds/ | shuf -n 1)

feh --bg-tile /usr/share/backgrounds/$file  && feh --bg-fill /usr/share/backgrounds/$file --window-id 2