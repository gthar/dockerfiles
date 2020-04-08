#!/bin/sh

set -xe

PORT=${PORT:-8000}
ROUTE_PREFIX=${ROUTE_PREFIX:-/}

current_user_principal="/user"

chown -R xandikos:xandikos /var/lib/xandikos

case $1 in
    xandikos)
        cd /opt/xandikos
        exec su-exec xandikos python3 -m xandikos.web \
                --port="${PORT}" \
                --listen-address='0.0.0.0' \
                -d /var/lib/xandikos/data \
                --current-user-principal="${current_user_principal}" \
                --route-prefix "${ROUTE_PREFIX}" \
                --autocreate \
                --defaults
        ;;
    *)
        exec "$@"
        ;;
esac

