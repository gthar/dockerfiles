IMG_NAME = syncthing
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64,linux/arm64

.PHONY: build build-nc buildx push

hw=$(shell uname -m)
ifeq ($(hw), x86_64)
	TARGETPLATFORM=linux/amd64
else ifeq ($(hw), aarch64)
	TARGETPLATFORM=linux/arm64
else
	TARGETPLATFORM=linux/$(hw)
endif

build: Dockerfile
	docker build -t $(IMG) --build-arg TARGETPLATFORM=$(TARGETPLATFORM) .

buildx: Dockerfile
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.

push: build
	docker image push $(IMG)

build-nc: Dockerfile
	docker build --no-cache -t $(IMG) --build-arg ARCH=$(ARCH) .
