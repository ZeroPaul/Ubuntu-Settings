#!/bin/bash

DIR="$HOME/.image-background"
PIC=$(ls $DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
# echo $PIC
