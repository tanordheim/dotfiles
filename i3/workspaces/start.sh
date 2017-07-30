#!/bin/bash

TERM=$1
WS1=$2
WS2=$3
WS3=$4
WS4=$5
WS5=$6
WS6=$7
WS7=$8
WS8=$9
WS9="${10}"
WS10="${11}"

# Switch to workspace 2 and set up the layout
i3-msg "workspace $WS2"
i3-msg "append_layout ~/.config/i3/workspaces/2.json"

# Start workspace 2 apps
$TERM &
slack &
firefox --new-instance \
        --new-tab --url https://www.facebook.com/ \
        --new-tab --url https://mail.google.com/mail/u/0/ \
        --new-tab --url https://mail.google.com/mail/u/1/ \
        --new-tab --url https://calendar.google.com/calendar/b/0/render \
        --new-tab --url https://calendar.google.com/calendar/b/1/render &

# Switch to workspace 10 and set up the layout
i3-msg "workspace $WS10"
i3-msg "append_layout ~/.config/i3/workspaces/10.json"

# Start workspace 10 apps
enpass &

# Default back to workspace 1
i3-msg "workspace $WS1"
