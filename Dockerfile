FROM jlesage/baseimage-gui:ubuntu-18.04-v3
ARG ripperxVersion='2.8.0'

# cdrom gid = 24
ENV \
  APP_NAME='ripperx' \
  HOME='/' \
  SUP_GROUP_IDS='24'

COPY startapp.sh /startapp.sh
COPY ripperX.rc /config/.ripperXrc

RUN \
  apt-get update && \
  apt-get upgrade -y && \
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
