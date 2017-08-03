#!/bin/sh

DPI=120
I3CFG=config-desktop
XRES=.Xresources-desktop
HOSTNAME=$(hostname)

if [ "$HOSTNAME" == "inferno" ]
then
  DPI=140
  I3CFG=config-laptop
  XRES=.Xresources-laptop
fi

# Configure displays
xrdb -merge $HOME/$XRES
xrandr --dpi $DPI

# Start the gnome keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Launch I3
exec i3 -c $HOME/.config/i3/$I3CFG
