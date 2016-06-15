#!/bin/bash
# This quick and dirty script will return the URL of the album for the current track played by your favorite MPD.
#
# Requires:
# - mpc for getting the trackID
# - curl for getting the trackinformation
#
# This is intended to be run when running Mopidy and Mopidy-Spotify
# Example of usage could be with terminal-notifier or geektool

# Grep current track ID
SONGID=$(mpc current --format '%file%' | cut -f3- -d':')

# Curl Track Info, grep url for images, take the first one, cut url between 3th " and 4th "
curl -s -X GET "https://api.spotify.com/v1/tracks/$SONGID" | grep "\"url\" : \"https://i.scdn.co/image/" | head -1 | cut -d "\"" -f4 | cut -d "\"" -f1
