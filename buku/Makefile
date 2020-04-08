USERNAME = rilla
IMG_NAME = buku

.PHONY: build build-nc

build: Dockerfile
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
