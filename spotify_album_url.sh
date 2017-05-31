#!/bin/bash
# This quick and dirty script will return the URL of the album for the current track played by your favorite MPD.
#
# Expects filename as argument in format: spotify:track:<ID>

# Requires:
# - curl for getting the trackinformation
#
# This is intended to be run when running Mopidy and Mopidy-Spotify
# Example of usage could be with terminal-notifier or geektool

# Grep current track ID as argument
TRACKID=$(echo $1 | cut -f3- -d':')

# Get personal spotify token. Can generated here https://developer.spotify.com/web-api/console/get-track/
TOKEN=$(cat ~/.spotify/token)

# Curl Track Info with token, grep url for images, take the first one, cut url between 3th " and 4th "
curl -s -X GET "https://api.spotify.com/v1/tracks/$TRACKID" -H "Accept: application/json" -H "Authorization: Bearer $TOKEN" | grep "\"url\" : \"https://i.scdn.co/image/" | head -1 | cut -d "\"" -f4 | cut -d "\"" -f1