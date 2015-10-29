#!/bin/bash

set -e

HOST=$(hostname -A | tr -d ' ')

sed -i "s|<HOST>|${HOST}|g" /etc/squid3/openssl.cnf
sed -i "s|<HOST>|${HOST}|g" /etc/squid3/squid.conf

mkdir -p /etc/squid3/certs

if ! [ -f "/etc/squid3/certs/${HOST}.crt" ]; then
  /usr/local/bin/mk-certs.sh
fi

chown -R proxy: /etc/squid3/certs

cat "/etc/squid3/certs/${HOST}.crt"

# /usr/sbin/squid3 -Nz

chown -R proxy: /var/cache/squid3
chown -R proxy: /var/log/squid3

/usr/sbin/squid3 -Nz

exec /usr/sbin/squid3 -Nd2
