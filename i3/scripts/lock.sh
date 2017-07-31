#!/bin/sh

TYPE="$1"

# Take a screenshot and pixellate it
# scrot /tmp/screenlock.png
# mogrify -scale 10% -scale 1000% /tmp/screenlock.png

# Lock the screen
i3lock -c 000000

if [ "$TYPE" == "suspend" ]
then

  # Suspend the machine
  systemctl suspend

else

  # Turn off the screen after 60 seconds
  sleep 60; pgrep i3lock && xset dpms force off

fi
