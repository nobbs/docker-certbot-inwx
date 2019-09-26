FROM python:3.7-alpine3.10

ENTRYPOINT [ "certbot" ]
EXPOSE 80 443
VOLUME /etc/letsencrypt /var/lib/letsencrypt
WORKDIR /opt/certbot

RUN set -x && apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
&& pip install certbot==0.38.0 certbot-dns-inwx==2.1.2 \
&& apk del .build-deps 
