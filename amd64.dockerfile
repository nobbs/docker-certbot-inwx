FROM amd64/python:3-alpine

ENV CERTBOT_VERSION 1.0.0
ENV INWX_VERSION 2.1.2

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
&& apk add --no-cache tzdata \
&& pip install certbot==${CERTBOT_VERSION} certbot-dns-inwx==${INWX_VERSION} \
&& apk del .build-deps 

