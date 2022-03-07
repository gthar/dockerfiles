IMG_NAME = mpd
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64,linux/arm64

.PHONY: build build-nc push

build: Dockerfile
	docker build -t $(IMG) .

buildx: Dockerfile
	docker buildx build \
	    --platform $(PLATFORMS) \
	    --tag $(IMG) \
	    --push \
	    .

push: build
	docker image push $(IMG)

build-nc: Dockerfile
	docker build --no-cache -t $(IMG) .
