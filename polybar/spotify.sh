#!/bin/sh

STATUS=$(playerctl status 2>&1)
if [ $? -ne 0 ]
then
    echo ""
    exit 0
fi

if [ "$STATUS" = "Playing" ]
then
    title=$(playerctl metadata xesam:title)
    artist=$(playerctl metadata xesam:artist)
    echo "$title - $artist"
else
    echo ""
fi
