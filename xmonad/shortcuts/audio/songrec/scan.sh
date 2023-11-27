#!/bin/bash
id=10

dunstify -t 5000 "Listening!" "Please wait..." -r "$id"

cd /home/tomi/code/xmonad/audio/songrec/

timeout 20s songrec recognize -d default -j > ./track.json

if [ ! $(stat -c%s "./track.json") != "0" ]; then
	dunstify -t 5000 "Sorry!" "Can't seem to find that..." -r "$id"
	rm -rf ./track.json
	exit
fi

track=$(cat track.json)
imageURL=$(echo $track | jq .track.images.coverart | tr -d '"')
artist=$(echo $track | jq .track.subtitle | tr -d '"')
song=$(echo $track | jq .track.title | tr -d '"')

curl -s ${imageURL} --output image.jpg 

ACTION=$(dunstify -t 10000 --action="default, YT" -i /home/tomi/code/xmonad/audio/songrec/image.jpg "Song found!" "$song - $artist" -r "$id")

case "$ACTION" in
"default")
    firefox --new-tab "https://youtube.com/results?search_query=${song// /+}+-+${artist// /+}"
    ;;
esac

rm ./track.json
rm ./image.jpg