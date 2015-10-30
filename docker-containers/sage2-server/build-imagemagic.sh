#!/bin/bash

set -e

DOWNLOAD_HOST=http://www.imagemagick.org/download
ARCHIVE=ImageMagick.tar.gz

NAME=ImageMagickBuild

export CFLAGS="-O3 -march=corei7-avx"
export CXXFLAGS="-O3 -march=corei7-avx"

wget -nc $DOWNLOAD_HOST/$ARCHIVE
mkdir ${NAME}
cd ${NAME}
tar --strip-components=1 -xzvpf ../$ARCHIVE
./configure --with-gslib
make -j $(nproc)
make
make install
