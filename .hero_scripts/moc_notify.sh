#!/usr/bin/env bash

NOW_MUSIC=$(lsof -F -c mocp | grep /Mú)
DIRECTORY_MUSIC=$HOME/Música/
FILE_MUSIC=$(basename -- "$NOW_MUSIC")
FILE_NAME=${FILE_MUSIC%.*}

MOC_SONG=$(mocp -Q %song)
MOC_ARTIST=$(mocp -Q %artist)
MOC_ALBUM=$(mocp -Q %album)

BASE_64=$(echo "$MOC_ARTIST$MOC_ALBUM" | base64)

IMAGE_NAME=$BASE_64".jpg"
ART="$HOME/.art/""$IMAGE_NAME"
SERVICE="mocp"

if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running" 
    if [ -f "$ART" ]; then
        echo "$IMAGE_NAME exist"
    else
        ffmpeg -i "$DIRECTORY_MUSIC$FILE_MUSIC" "$IMAGE_NAME" 2>/dev/null
        mv "$IMAGE_NAME" $HOME/.art 
        echo "$IMAGE_NAME does not exist"
    fi
    
    DESCRIPTION="Artist  > $MOC_ARTIST ""\\r""Album > $MOC_ALBUM"
    notify-send -i "$ART" "$MOC_SONG" "$DESCRIPTION"
    echo $ART

else
    echo "$SERVICE stopped"
fi




# cd $DIRECTORY_MUSIC
# p=`dirname "$5"`
# if [[ -f $p/cover.jpg ]]; then
# cp "$p/cover.jpg" /tmp/cover.jpg
# notify-send -i /tmp/cover.jpg "$1" "$2\n$3"
# else
# notify-send -i audio-headphones "$1" "$2\n$3"
# fi
