FROM ubuntu:trusty
MAINTAINER Roman Zubatyuk <zubatyuk@gmail.com>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
          nvidia-340 libcuda1-340 nvidia-settings libgl1-mesa-dri xfonts-base xauth \
          nvidia-opencl-icd-340 xfonts-100dpi xfonts-75dpi xfonts-scalable \
          mesa-vdpau-drivers vdpauinfo vdpau-va-driver xinit mesa-utils gpointing-device-settings \
          xinput xserver-xorg-input-kbd xfonts-cyrillic x11-utils xbitmaps xserver-xorg \
          x11-xserver-utils xli xdotool xdg-utils hicolor-icon-theme libx11-dev \
          netpbm x11-apps \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

VOLUME /tmp/.X11-unix
VOLUME /tmp/.ICE-unix

RUN    useradd -m -U viz \
    && echo "allowed_users=anybody" > /etc/X11/Xwrapper.config \
    && mkdir -p -m 1777 /tmp/.X11-unix \ 
    && mkdir -p -m 1777 /tmp/.ICE-unix 

COPY   x11screens.c /tmp/x11screens.c
RUN    gcc -o /usr/local/bin/x11screens /tmp/x11screens.c -lX11


