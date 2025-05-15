FROM jrottenberg/ffmpeg:4.3-alpine

# Create working directory
WORKDIR /app

# Copy the overlay image into the container
COPY overlay.png /app/overlay.png

# Create a simple script to apply the overlay to an input video
RUN echo '#!/bin/sh\nffmpeg -i "$1" -i /app/overlay.png -filter_complex "[0:v][1:v] overlay=0:0" -c:a copy output.mp4' > /app/run.sh && chmod +x /app/run.sh

# Set the script as the default command
ENTRYPOINT ["/app/run.sh"]
