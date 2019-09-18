#!/bin/bash

primary="eDP-1"
secondary=$(xrandr \
| grep -Eo "^.*\s(connected|disconnected)" \
| grep -Eo "^.*\s" \
| grep -Ev "$primary" \
| sort )


x="xrandr --output $primary --auto --primary"

prev=$primary
while read -r curr; do

  x+=" --output $curr --auto --right-of $prev"
  prev=$curr

done <<< "$secondary"

echo $x
eval $x
