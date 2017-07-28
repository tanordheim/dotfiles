#!/bin/sh

# Configure displays
xrdb -merge ~/.Xresources
xrandr --dpi 140

# Start the gnome keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Launch I3
exec i3
