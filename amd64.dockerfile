FROM amd64/python:3-alpine

ENTRYPOINT [ "certbot" ]
EXPOSE 80 443
VOLUME /etc/letsencrypt /var/lib/letsencrypt
WORKDIR /opt/certbot

RUN set -x && apk update && apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
&& pip install certbot==0.38.0 certbot-dns-inwx==2.1.2 \
&& apk del .build-deps 

