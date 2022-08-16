#!/bin/sh

update-binfmts --enable
docker buildx create --use
docker buildx inspect --bootstrap

exec "$@"
