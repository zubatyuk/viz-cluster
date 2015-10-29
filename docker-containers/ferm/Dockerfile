FROM alpine:latest
MAINTAINER Roman Zubatyuk <zubatyuk@gmail.com>

COPY   run-ferm.sh /usr/local/bin/run-ferm
RUN    apk add --update ferm \
    && rm -fr /var/cache/apk \
    && chmod +x /usr/local/bin/run-ferm

CMD   run-ferm
