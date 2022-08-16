FROM alpine:3.16

RUN apk add --no-cache \
        nginx \
        curl \
        php7-fpm \
        php7 \
        php7-curl \
        php7-iconv \
        php7-json \
	php7-openssl \
        php7-dom && \
    mkdir -p /var/www/rainloop && \
    cd /var/www/rainloop && \
    curl -sL https://repository.rainloop.net/installer.php | php && \
    sed -i.bak 's/^listen = 127.0.0.1:9000/listen = 9000/' /etc/php7/php-fpm.d/www.conf && \
    addgroup \
        --gid 10001 \
        rainloop && \
    adduser \
        --uid 10000 \
        --home /var/www/rainloop \
        --ingroup rainloop \
        --disabled-password \
        --shell /sbin/nologin \
        rainloop && \
    mkdir -p /run/nginx /var/run && \
    touch /var/run/nginx.pid && \
    chown -R rainloop:rainloop \
        /var/www/rainloop \
        /var/log/php7 \
        /var/lib/nginx \
        /var/log/nginx \
        /run/nginx \
	/var/run/nginx.pid

USER rainloop
WORKDIR /var/www/rainloop
