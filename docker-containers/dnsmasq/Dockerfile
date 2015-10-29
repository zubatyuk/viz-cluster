FROM alpine:latest
MAINTAINER Roman Zubatyuk <zubatyuk@gmail.com>

RUN    apk add --update dnsmasq \
    && rm -fr /var/cache/apk

CMD dnsmasq --conf-dir=/etc/dnsmasq.d --cache-size=2000 --dns-forward-max=1000 --bind-dynamic 
