#!/bin/sh

exec scanimage -d net:pear.l:genesys \
		-p --resolution 150 --swdeskew --swcrop --swdespeck --despeck 4 \
		--mode col -p --format=png \
	| convert -level 0,75% - -
