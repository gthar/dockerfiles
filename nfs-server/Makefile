USERNAME = rilla
IMG_NAME = nfs-server

.PHONY: build build-nc

build: Dockerfile entrypoint.sh
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile entrypoint.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
