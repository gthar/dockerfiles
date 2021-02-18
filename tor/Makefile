USERNAME = rilla
IMG_NAME = tor

.PHONY: build build-nc

build: Dockerfile entrypoint.sh
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile entrypoint.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
