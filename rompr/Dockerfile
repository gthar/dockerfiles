FROM php:7.2-fpm-alpine

ARG ROMPR_VERSION=2.06

ARG S6_OVERLAY_VERSION=3.1.5.0
ARG ARCH=aarch64


# init ########################################################################

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${ARCH}.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-${ARCH}.tar.xz && \
    rm /tmp/s6-overlay-noarch.tar.xz \
       /tmp/s6-overlay-${ARCH}.tar.xz

COPY services.d /etc/services.d

ENTRYPOINT ["/init"]


# php #########################################################################

RUN apk add curl-dev libpng-dev icu-dev sqlite-dev && \
    docker-php-ext-install curl gd intl pdo_sqlite && \
    apk del curl-dev libpng-dev icu-dev sqlite-dev && \
    apk add curl libpng icu sqlite

# according to https://fatg3erman.github.io/RompR/Recommended-Installation-on-Linux
# we want:
#
# allow_url_fopen = On
# memory_limit = 128M
# max_execution_time = 1800
# post_max_size = 256M
# upload_max_filesize = 10M
# max_file_uploads = 200
# 
# as well as
#
# extension=curl
# extension=pdo_sqlite
# extension=gd
# extension=intl

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(allow_url_fopen =\).*$/\1 On/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(memory_limit =\).*$/\1 128M/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(max_execution_time =\).*$/\1 1800/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(post_max_size =\).*$/\1 256M/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(upload_max_filesize =\).*$/\1 10M/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/^\(max_file_uploads =\).*$/\1 200/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/;\(extension=curl\)/\1/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/;\(extension=pdo_sqlite\)/\1/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/;\(extension=gd\).*$/\1/' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/;\(extension=intl\)/\1/' "$PHP_INI_DIR/php.ini" && \
    echo "user=rompr" >> /usr/local/etc/php-fpm.conf

CMD php-fpm


# nginx #######################################################################

RUN apk add --no-cache nginx
COPY nginx.conf /etc/nginx/nginx.conf


# rompr #######################################################################

RUN addgroup \
        --gid 10001 \
        rompr && \
    adduser \
        --uid 10000 \
        --home /var/www/rompr \
        --ingroup rompr \
        --disabled-password \
        --shell /sbin/nologin \
        rompr

RUN mkdir -p /var/www
ADD https://github.com/fatg3erman/RompR/releases/download/${ROMPR_VERSION}/rompr-${ROMPR_VERSION}.zip /var/www
RUN unzip "/var/www/rompr-$ROMPR_VERSION.zip" -d /var/www && \
    rm "/var/www/rompr-$ROMPR_VERSION.zip" && \
    mkdir -p /var/www/rompr/albumart /var/www/rompr/prefs && \
    mkdir -p /run/nginx /var/run && \
    touch /var/run/nginx.pid && \
    chown -R rompr:rompr /var/www/rompr

WORKDIR /var/www/rompr

###############################################################################


