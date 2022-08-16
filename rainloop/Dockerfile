FROM php:7.4-fpm-alpine

RUN apk add --no-cache nginx

RUN addgroup \
        --gid 10001 \
        rainloop && \
    adduser \
        --uid 10000 \
        --home /var/www/rainloop \
        --ingroup rainloop \
        --disabled-password \
        --shell /sbin/nologin \
        rainloop

RUN mkdir -p /var/www/rainloop && \
    cd /var/www/rainloop && \
    curl -sL https://repository.rainloop.net/installer.php | php && \
    mkdir -p /run/nginx /var/run && \
    touch /var/run/nginx.pid && \
    chown -R rainloop:rainloop /var/www/rainloop

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    echo "user=rainloop" >> /usr/local/etc/php-fpm.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/rainloop

ENTRYPOINT ["/entrypoint.sh"]
