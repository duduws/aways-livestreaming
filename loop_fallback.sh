#!/bin/bash

while true
do
    # Check if the Twitch stream is online
    if ffmpeg -i "$TWITCH_URL/$TWITCH_STREAM_KEY" -t 2 -f null /dev/null 2>&1; then
        echo "Twitch stream is online."
    else
        echo "Twitch stream is offline. Switching to fallback video."
        sed -i 's|push $TWITCH_URL/$TWITCH_STREAM_KEY;|push rtmp://localhost/live/fallback;|' /etc/nginx/nginx.conf
    fi

    sleep 10
done
