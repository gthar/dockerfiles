IMG_NAME = syncthing
REGISTRY=registry.monotremata.xyz:443

IMG=$(REGISTRY)/$(IMG_NAME)

.PHONY: build build-nc push

hw=$(shell uname -m)
ifeq ($(hw), x86_64)
	ARCH=amd64
else ifeq ($(hw), aarch64)
	ARCH=arm64
else
	ARCH=$(hw)
endif

build: Dockerfile docker-entrypoint.sh
	docker build -t $(IMG) --build-arg ARCH=$(ARCH) .

push: build
	docker image push $(IMG)

build-nc: Dockerfile docker-entrypoint.sh
	docker build --no-cache -t $(IMG) --build-arg ARCH=$(ARCH) .
