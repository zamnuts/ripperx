FROM jlesage/baseimage-gui:ubuntu-18.04-v3
ARG ripperxVersion='2.8.0'

ENV \
  APP_NAME='ripperx' \
  HOME='/'
VOLUME ['/output']
COPY startapp.sh /startapp.sh
COPY ripperX.rc /config/.ripperXrc

RUN \
  apt-get update && \
  DEBIAN_FRONTEND='noninteractive' \
    apt-get \
      -y \
      -o Dpkg::Options::='--force-confdef' \
      -o Dpkg::Options::='--force-confold' \
      install \
      ca-certificates \
      ripperx="${ripperxVersion}-*" \
      flac \
      lame \
      mppenc \
      vorbis-tools \
    && \
  apt-get clean && \
  update-ca-certificates