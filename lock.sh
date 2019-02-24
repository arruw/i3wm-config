#!/bin/bash

IMAGE=~/.config/i3/tmp/i3lock_image.png

scrot $IMAGE

RESOLUTION=$(identify -format '%wx%h' $IMAGE)

convert -colorspace Gray -scale 10% -scale $RESOLUTION $IMAGE $IMAGE

i3lock -uef -i $IMAGE

rm $IMAGE
