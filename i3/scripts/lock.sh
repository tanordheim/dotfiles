#!/bin/bash

TYPE="$1"
METHOD="ss"
SS="/tmp/screenlock.png"
LOCK="$HOME/.config/i3/scripts/lock.png"
RES=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')

if [ "$METHOD" == "bg" ]
then

  # Use the current background image as lock screen
  cp ~/Pictures/wallpaper.png $SS

else

  # Take a screenshot of the current screen
  ffmpeg -f x11grab \
        -video_size $RES \
        -y \
        -i $DISPLAY \
        -i $LOCK \
        -filter_complex "boxblur=7:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" \
        -vframes 1 \
        $SS

fi

i3lock -i $SS
rm -f $SS

if [ "$TYPE" == "suspend" ]
then

  # Suspend the machine
  systemctl suspend

else

  # Turn off the screen after 5 seconds
  sleep 5; pgrep i3lock && xset dpms force off

fi
