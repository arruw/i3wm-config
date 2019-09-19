#!/bin/bash

primary="eDP-1"
secondary=$(xrandr \
| grep -Eo "^.*\s(connected|disconnected)" \
| grep -Eo "^.*\s" \
| grep -Ev "$primary" \
| sort )

xrandr --output $primary --auto --primary

while read -r curr; do

  xrandr --output $curr --same-as $primary

done <<< "$secondary"
