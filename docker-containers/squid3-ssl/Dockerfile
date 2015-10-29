FROM ubuntu:trusty
MAINTAINER Roman Zubatyuk <zubatyuk@gmail.com> 

COPY   deb/squid3-common_3* deb/squid3_3* /tmp/
 
RUN    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         libecap2 libgssapi-krb5-2 libkrb5-3 libldap-2.4-2 libltdl7 libnetfilter-conntrack3 \
         libsasl2-2 libxml2 squid3-common ssl-cert ca-certificates \
    && dpkg -i /tmp/squid3-common_3* /tmp/squid3_3* \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/*.deb

RUN    /usr/lib/squid3/ssl_crtd -c -s /var/lib/ssl_db \
    && chown -R proxy:proxy /var/lib/ssl_db 

COPY   squid.conf openssl.cnf /etc/squid3/
COPY   mk-certs.sh run-squid.sh /usr/local/bin/
RUN    chmod +x /usr/local/bin/mk-certs.sh /usr/local/bin/run-squid.sh

EXPOSE 3128

CMD   /usr/local/bin/run-squid.sh
