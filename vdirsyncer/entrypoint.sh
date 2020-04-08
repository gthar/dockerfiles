#!/bin/sh

mkdir -p /var/lib/vdirsyncer/tokens /var/lib/vdirsyncer/status
chown -R vdirsyncer:vdirsyncer \
    /var/lib/vdirsyncer/tokens \
    /var/lib/vdirsyncer/status

export VDIRSYNCER_CONFIG=/var/lib/vdirsyncer/config

case $1 in
    discover)
        exec su-exec vdirsyncer vdirsyncer "$@"
        ;;
    sync)
        exec su-exec vdirsyncer vdirsyncer "$@"
        ;;
    task)
        su-exec vdirsyncer vdirsyncer discover && \
            /usr/bin/crontab -u vdirsyncer /crontab && \
            exec /usr/sbin/crond -f -L /dev/stdout
        ;;
    *)
        exec "$@"
        ;;
esac
