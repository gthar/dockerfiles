IMG_NAME=buildx-qemu
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64,linux/arm64

.PHONY: build push buildx

ARCH=$(shell uname -m)

ifeq ($(ARCH),x86_64)
  TARGETARCH=amd64
else ifeq ($(ARCH),aarch64)
  TARGETARCH=arm64
else
  TARGETARCH=amd64
endif

build: Dockerfile entrypoint.sh
	docker build -t $(IMG) --build-arg TARGETARCH=$(TARGETARCH) .

push: build
	docker image push $(IMG)

buildx: Dockerfile entrypoint.sh
	docker buildx build \
	    --platform $(PLATFORMS) \
	    --tag $(IMG) \
	    --push \
	    .
