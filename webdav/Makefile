IMG_NAME = webdav
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64,linux/arm64

.PHONY: build push buildx

build: Dockerfile nginx.conf
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

buildx: Dockerfile nginx.conf
	docker buildx build \
	    --platform $(PLATFORMS) \
	    --tag $(IMG) \
	    --push \
	    .
