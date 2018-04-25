#!/bin/zsh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

KODI="http://pear.l:8080/jsonrpc"

if [[ "$1" =~ playlist\\?list=(.\*) ]]; then 
	curl -H "Content-Type: application/json" -v -d '[{"jsonrpc":"2.0","method":"Player.open","params":{"item":{"file": "plugin://plugin.video.youtube/?path=/root/video&action=play_all&playlist='$match[1]'"}},"id":1}]' -s "$KODI"
	exit 0
fi

if [[ "$1" =~ playlist\\?list=(.\*) ]]; then
    curl -H "Content-Type: application/json" -v -d '[{"jsonrpc":"2.0","method":"Player.open","params":{"item":{"file": "plugin://plugin.video.youtube/?path=/root/video&action=play_video&videoid='$match[1]'"}},"id":1}]' -s "$KODI"
    exit 0
fi
