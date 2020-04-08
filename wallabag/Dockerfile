FROM alpine:3.12

ARG WALLABAG_VERSION=2.4.0

RUN apk --no-cache add \
        git su-exec make nginx curl php7 \
        php7-bcmath php7-ctype php7-curl php7-dom php7-fpm php7-gd \
        php7-gettext php7-iconv php7-intl php7-json php7-mbstring \
        php7-openssl php7-pdo_sqlite php7-phar php7-session php7-simplexml \
        php7-sockets php7-tidy php7-tokenizer php7-xml php7-xmlreader

RUN curl -s https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN mkdir -p /etc/nginx /etc/php7
COPY php-fpm.conf php.ini /etc/php7/

RUN mkdir -p /var/www && \
    git clone \
        --branch $WALLABAG_VERSION \
        --depth 1 \
        https://github.com/wallabag/wallabag.git \
        /var/www/wallabag

COPY parameters.yml /var/www/wallabag/app/config/parameters.yml

WORKDIR /var/www/wallabag

RUN SYMFONY_ENV=prod composer install \
        --no-dev \
        -o \
        --prefer-dist \
        --no-progress

RUN addgroup -g 1000 wallabag && \
    adduser -D -h /var/www -G wallabag -u 1000 wallabag && \
    chown -R wallabag:wallabag /var/www/wallabag

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["wallabag"]
