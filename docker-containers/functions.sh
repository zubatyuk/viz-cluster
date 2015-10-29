#!/bin/bash

REGISTRY=registry.local:5000

dockerfile_buildtime_aptproxy () {
sed 's%\(^FROM .*\)%\1\nADD https://raw.githubusercontent.com/zubatyuk/docker-containers/master/aptproxy.sh /tmp/\nRUN chmod 777 /tmp/aptproxy.sh \&\& /tmp/aptproxy.sh%'
echo "RUN /tmp/aptproxy.sh clean && rm /tmp/aptproxy.sh"
}

dockerfile_runtime_squid () {
if [[ -z $(nc -z squid3.local 3128) && $? -eq 0 ]]; then
    docker logs squid3-ssl | sed -n '/BEGIN/,/END/p' > squid3.local.crt
    echo "COPY squid3.local.crt /usr/share/ca-certificates/squid3.local.crt"
    echo "RUN echo squid3.local.crt >> /etc/ca-certificates.conf && /usr/sbin/update-ca-certificates"
    echo "ENV http_proxy='http://squid3.local:3128'"
    echo "ENV https_proxy='http://squid3.local:3128'"
fi
}
