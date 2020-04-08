#!/bin/sh

chown -R syncthing:syncthing /data
chown -R syncthing:syncthing /var/lib/syncthing
chown -R syncthing:books /data/books
chown -R syncthing:buku /data/buku && touch /data/buku/bookmarks.db && chmod '664' /data/buku/bookmarks.db
chmod '2775' /data/books

exec su-exec syncthing "$@"
