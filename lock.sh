#!/bin/bash
# i3lock works only with PNG images

# pixelize screenshot
#IMAGE=~/.config/i3/tmp/i3lock_image.png
#scrot $IMAGE
#RESOLUTION=$(identify -format '%wx%h' $IMAGE)
#convert -colorspace Gray -scale 10% -scale $RESOLUTION $IMAGE $IMAGE
#i3lock -ef -i $IMAGE
#rm $IMAGE

# blur background image
IMAGE=~/.config/i3/tmp/i3lock_image.png
convert ~/.config/i3/tmp/background.jpg -filter Gaussian -resize 50% -define filter:sigma=4 -resize 200%  $IMAGE
i3lock -eft -i $IMAGE
rm $IMAGE

