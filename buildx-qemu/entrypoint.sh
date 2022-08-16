#!/bin/sh

update-binfmts --enable
docker buildx create --driver docker-container --driver-opt network=host --name image-builder --use
docker buildx inspect --bootstrap

exec "$@"
