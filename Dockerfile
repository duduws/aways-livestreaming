# Use an official Nginx image
FROM nginx:latest

# Install tools and dependencies
RUN apt-get update && \
    apt-get install -y wget ffmpeg

# Download and install Nginx RTMP module
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv nginx-rtmp-module-master /usr/src/nginx-rtmp-module

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy default fallback video
COPY fallback.mp4 /usr/share/nginx/html/fallback.mp4

# Expose RTMP and HTTP ports
EXPOSE 1935
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
