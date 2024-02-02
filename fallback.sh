#!/bin/bash

while true
do
    # Check if the main ingest is reachable
    if nc -z main-ingest-host main-ingest-port; then
        echo "Main ingest is online."
    else
        echo "Main ingest is offline. Switching to fallback video."
        sed -i 's|push rtmp://main-ingest-url;|push rtmp://localhost/live/fallback;|' /etc/nginx/nginx.conf
    fi

    sleep 10
done
