# create an Alpine container image
FROM ubuntu:latest
# update package manager and install UUP dump dependencies packages
RUN apt-get update \
    && apt-get install -y \
      aria2 \
      cabextract \
      wimtools \
      chntpw \
      genisoimage \
    && rm -rf /var/lib/apt/lists/*
