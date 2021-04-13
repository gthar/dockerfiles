#!/bin/sh

sleep 5
exec /usr/local/bin/dendrite-monolith-server -config /etc/dendrite/dendrite.yaml "$@"
