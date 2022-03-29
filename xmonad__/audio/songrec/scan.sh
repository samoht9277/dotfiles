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

dunstify -t 5000 -i /home/tomi/code/xmonad/audio/songrec/image.jpg "Song found!" "$song - $artist" -r "$id"

rm -rf ./track.json
rm -rf ./image.jpg