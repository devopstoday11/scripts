#!/bin/zsh

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <url>"
	exit 1
fi

KODI="http://pear.l:8080/jsonrpc"

exec curl -H "Content-Type: application/json" -d '[{"jsonrpc":"2.0","method":"Player.open","params":{"item":{"file": "'"$1"'"}},"id":1}]' "$KODI"
