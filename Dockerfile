FROM jrottenberg/ffmpeg:4.4-ubuntu

# Copy overlay image into container
COPY overlay.png /overlay.png

# Copy processing script
COPY process.sh /process.sh
RUN chmod +x /process.sh

# Set default run command
ENTRYPOINT ["/process.sh"]
