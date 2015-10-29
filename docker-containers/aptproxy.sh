#!/bin/bash

APTPROXY=aptproxy
PORT=3142

if [ "$1" == "clean" ]; then
    rm /etc/apt/apt.conf.d/50squid-deb-proxy
    exit 0
fi

nc -z $APTPROXY $PORT
if [  $? -eq 0 ]; then
    echo "Acquire::http::proxy \"http://${APTPROXY}:${PORT}\";" > /etc/apt/apt.conf.d/50squid-deb-proxy
    echo "Acquire::https::proxy \"DIRECT\";" >> /etc/apt/apt.conf.d/50squid-deb-proxy
fi
