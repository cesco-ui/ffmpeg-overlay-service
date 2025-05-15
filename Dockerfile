FROM jrottenberg/ffmpeg:4.3-alpine

WORKDIR /app

# Copy files into the container
COPY overlay.png /app/overlay.png
COPY run.sh /app/run.sh

# Make sure run.sh is executable
RUN chmod +x /app/run.sh

# Run the overlay script by default
ENTRYPOINT ["/app/run.sh"]
