#!/bin/sh

set -ex

INSTALL_DIR=/var/www/wallabag

set_permissions () {
    mkdir -p \
        "${INSTALL_DIR}/data/assets" \
        "${INSTALL_DIR}/data/db"
    chown -R wallabag:wallabag "${INSTALL_DIR}/data" 
}

db_install () {
    [ -f "${INSTALL_DIR}/data/db/wallabag.sqlite" ] || \
        su-exec wallabag php "${INSTALL_DIR}/bin/console" \
                    wallabag:install --env=prod -n
}

case $1 in
    wallabag)
	set_permissions
	db_install
        exec su-exec wallabag php-fpm7 -F
        ;;
    nginx)
        exec nginx -c /etc/nginx/nginx.conf -g "daemon off;"
        ;;
    import)
	set_permissions
        exec su-exec wallabag "${INSTALL_DIR}/bin/console" \
                wallabag:import:redis-worker -e=prod "$2" -vv
        ;;
    migrate)
	set_permissions
        exec su-exec wallabag "${INSTALL_DIR}/bin/console" \
                doctrine:migrations:migrate --env=prod --no-interaction
        ;;
    *)
	set_permissions
        exec su-exec wallabag "$@"
esac
