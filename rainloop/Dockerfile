FROM alpine:3.13

RUN apk add --no-cache \
        nginx \
        curl \
        php7-fpm \
        php7 \
        php7-curl \
        php7-iconv \
        php7-json \
        php7-dom && \
    mkdir -p /var/lib/www/rainloop && \
    cd /var/lib/www/rainloop && \
    curl -sL https://repository.rainloop.net/installer.php | php

RUN addgroup \
        --gid 10001 \
        rainloop && \
    adduser \
        --uid 10000 \
        --home /var/lib/www/rainloop \
        --ingroup rainloop \
        --disabled-password \
        --shell /sbin/nologin \
        rainloop && \
    mkdir /run/nginx && \
    chown -R rainloop:rainloop \
        /var/lib/www/rainloop \
        /var/log/php7 \
        /var/lib/nginx \
        /var/log/nginx \
        /run/nginx

USER rainloop
WORKDIR /var/lib/www/rainloop
