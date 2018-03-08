#!/bin/sh

HOST=$(hostname)
killall polybar

export PRIMARY_MONITOR="DisplayPort-1"
export SECONDARY_MONITOR="DisplayPort-2"

if [ "$HOST" = "mirage" ]
then
    EDP_CONNECTED=$(xrandr --listmonitors | grep eDP-1)
    if [ $? -eq 0  ]
    then
        export PRIMARY_MONITOR="eDP-1"
        export SECONDARY_MONITOR=""
    else
        export PRIMARY_MONITOR="DP-1-2"
        export SECONDARY_MONITOR="DP-2-1"
    fi
fi

echo "primary=$PRIMARY_MONITOR"
echo "secondary=$SECONDARY_MONITOR"

if [ ! -z "$PRIMARY_MONITOR" ]
then
	echo "Launching primary polybar on monitor $PRIMARY_MONITOR"
	polybar primary &
fi

if [ ! -z "$SECONDARY_MONITOR" ]
then
	echo "Launching secondary polybar on monitor $SECONDARY_MONITOR"
	polybar secondary &
fi
