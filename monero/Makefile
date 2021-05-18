USERNAME = rilla
IMG_NAME = monero

.PHONY: build build-nc

hw=$(shell uname -m)
ifeq ($(hw), x86_64)
	ARCH=x64
else ifeq ($(hw), aarch64)
	ARCH=armv8
else
	ARCH=$(hw)
endif

build: Dockerfile
	docker build -t $(USERNAME)/$(IMG_NAME) --build-arg ARCH=$(ARCH) .

build-nc: Dockerfile
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) --build-arg ARCH=$(ARCH) .
