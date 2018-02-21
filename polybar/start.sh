#!/bin/sh

HOST=$(hostname)
killall polybar

export PRIMARY_MONITOR="DisplayPort-1"
export SECONDARY_MONITOR="DisplayPort-2"

if [ "$HOST" = "mirage" ]
then
	export PRIMARY_MONITOR="eDP-1"
	export SECONDARY_MONITOR=""
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
