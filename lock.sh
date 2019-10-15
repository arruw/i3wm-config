#!/bin/bash
# i3lock works only with PNG images

# switch to buildin display
# lock with blured background image
IMAGE=~/.config/i3/tmp/i3lock_image.png
RESOLUTION=$(xdpyinfo | grep dimensions | grep -Eo '([0-9]+x[0-9]+)' | head -1)
convert ~/.config/i3/tmp/background.jpg -filter Gaussian -resize 50% -define filter:sigma=4 -resize 200% -scale $RESOLUTION  $IMAGE
i3lock -ef -i $IMAGE
rm $IMAGE

