#!/bin/bash

WS=$1
TERM=$2

# Switch to workspace 2 and set up the layout
i3-msg "workspace $WS"
i3-msg "append_layout ~/.config/i3/workspaces/2.json"

# Start workspace apps
$TERM &
slack &
firefox --new-instance \
        --new-tab --url https://www.facebook.com/ \
        --new-tab --url https://mail.google.com/mail/u/0/ \
        --new-tab --url https://mail.google.com/mail/u/1/ \
        --new-tab --url https://calendar.google.com/calendar/b/0/render \
        --new-tab --url https://calendar.google.com/calendar/b/1/render &
