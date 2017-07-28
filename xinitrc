#!/bin/sh

xrdb -merge ~/.Xresources
xrandr --dpi 140
exec i3
