#!/bin/sh

set -e

if [ "$#" -ne 3 ]; then
	echo "Script for adding a watermark to an image using ImageMagick"
	echo " Usage: $0 <input-file> <watermark-label> <output-file>"
	exit 1
fi

infile="$1"
label="$2"
outfile="$3"

rowstr=""
for l in `seq 1 50`; do
	rowstr="$rowstr $label"
done

str=""
newl=$(printf '\n')
for l in `seq 1 50`; do
	str="$str$rowstr$newl"
done

convert "$infile" \
	-font Arial -pointsize 50 -draw \
	"translate 0,-800  rotate -30 gravity north fill-opacity 0.08 fill black text 0,12 '$str'" \
	"$outfile"

if [ $(which steghide) ]; then
	echo -n "$label" > /tmp/stean.txt
    steghide embed -p water:mark -ef /tmp/stean.txt -cf "$outfile"
	rm /tmp/stean.txt
else 
	echo 'Tip: Install optional "steghide" tool to embed the label in the image inconspicuously.'
fi
