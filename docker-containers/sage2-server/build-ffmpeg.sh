#!/bin/bash

set -e

DOWNLOAD_HOST=http://ffmpeg.org/releases
ARCHIVE=ffmpeg-2.8.tar.bz2

NAME=${ARCHIVE%%.tar.bz2}

rm -fr ${NAME}
wget -nc $DOWNLOAD_HOST/$ARCHIVE
tar -xjvf $ARCHIVE
cd ${NAME}
./configure --enable-gpl --enable-libx264 --enable-libwebp --enable-libvorbis --enable-libvpx --enable-shared --enable-nonfree --cpu=corei7-avx
make -j $(nproc)
make
make install
