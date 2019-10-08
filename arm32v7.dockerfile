FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v7/python:3-alpine

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

ENV CERTBOT_VERSION 0.39.0
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
