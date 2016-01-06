FROM webhippie/ubuntu:precise
MAINTAINER Thomas Boerger <thomas@webhippie.de>

ADD rootfs /
CMD ["bash"]

RUN groupadd -r steam && \
  useradd \
    -m -r -d /home/steam -g steam steam && \
  dpkg --add-architecture \
    i386 && \
  apt-get \
    update && \
  apt-get install -y \
    lib32gcc1 && \
  apt-get \
    clean && \
  curl \
    http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    | tar -C /home/steam -xzf - && \
  chown -R steam:steam \
    /home/steam && \
  steamcmd \
    +login anonymous +quit && \
  rm -f \
    /home/steam/Steam/logs/*
