USERNAME = rilla
IMG_NAME = syncthing

.PHONY: build build-nc

hw=$(shell uname -m)
ifeq ($(hw), x86_64)
	ARCH=amd64
else ifeq ($(hw), aarch64)
	ARCH=arm64
else
	ARCH=$(hw)
endif

build: Dockerfile docker-entrypoint.sh
	docker build -t $(USERNAME)/$(IMG_NAME) --build-arg ARCH=$(ARCH) .

build-nc: Dockerfile docker-entrypoint.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) --build-arg ARCH=$(ARCH) .
