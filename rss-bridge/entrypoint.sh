#!/bin/sh

set -ex

case $1 in
    rss-bridge)
        exec su-exec rssbridge php-fpm7 -F
        ;;
    nginx)
        exec nginx -g 'daemon off;'
        ;;
    *)
        exec su-exec rssbridge "$@"
esac
