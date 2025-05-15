#!/bin/sh
echo "Branding $1 with overlay..."
ffmpeg -i "$1" -i /app/overlay.png -filter_complex "[0:v][1:v] overlay=0:0" -c:a copy output.mp4
echo "Done. Output saved as output.mp4"
