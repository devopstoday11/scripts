#!/bin/sh

exec scanimage -d net:192.168.0.11:genesys \
		-p --resolution 150 --swdeskew --swcrop --swdespeck --despeck 4 \
		--mode col -p --format=png \
	| convert -level 0,75% - -
