USERNAME = rilla
IMG_NAME = git-daemon

.PHONY: build build-nc

build: Dockerfile entrypoint
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile entrypoint
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
