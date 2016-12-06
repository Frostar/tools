#!/bin/bash
# This quick and dirty script will return volume level or if muted return "muted"
# This can called from widget like nerdbar.

# If running on macOS:
if [[ "$OSTYPE" == "darwin"* ]]; then
    OUTPUT=$(osascript -e 'get volume settings');
    MUTEDSETTING=$(echo $OUTPUT | cut -f4- -d',' | cut -f2- -d':')

    if [ "$MUTEDSETTING" == "true" ]
    then
        echo "xx"
    else
        VOLLEVEL=$(echo $OUTPUT | cut -f1- -d',' | cut -f2- -d':' | sed 's/, .*//')
        printf "%02d" $VOLLEVEL
    fi
fi
