FROM alpine:3.14

RUN apk add --no-cache \
        git su-exec nginx php7 php7-fpm \
        php7-curl php7-json php7-mbstring php7-openssl php7-pecl-memcached \
        php7-simplexml php7-sqlite3 php7-xml && \
    sed -i.bak 's/^listen = 127.0.0.1:9000/listen = 9000/' /etc/php7/php-fpm.d/www.conf && \
    mkdir -p /var/www && \
    git clone https://github.com/RSS-Bridge/rss-bridge /var/www/rss-bridge  && \
    adduser -D -h /var/www/rss-bridge rssbridge && \
    chown -R rssbridge:rssbridge \
        /var/www/rss-bridge \
        /var/log/php7

WORKDIR /var/www/rss-bridge

COPY entrypoint.sh /entrypoint
RUN chmod 700 /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["rss-bridge"]
