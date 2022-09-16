#!/bin/sh

if [ -n "$SECRETS" ]; then
    echo "$SECRETS" > /etc/rsyncd.secrets
    chmod 600 /etc/rsyncd.secrets
fi

exec "$@"
