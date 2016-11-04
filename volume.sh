#!/bin/bash
# This quick and dirty script will return volume level or if muted return "muted"
# This can called from widget like nerdbar.

# If running on macOS:
if [[ "$OSTYPE" == "darwin"* ]]; then
    OUTPUT=$(osascript -e 'get volume settings');
    MUTEDSETTING=$(echo $OUTPUT | cut -f4- -d',' | cut -f2- -d':')
    VOLLEVEL=$(echo $OUTPUT | cut -f1- -d',' | cut -f2- -d':' | sed 's/, .*//')

    if [ "$MUTEDSETTING" == "true" ]
    then
        echo "Muted"
    else
        echo $VOLLEVEL
    fi
fi
