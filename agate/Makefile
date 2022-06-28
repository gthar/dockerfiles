IMG_NAME=agate
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64

.PHONY: build build-nc

build: Dockerfile
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

buildx: Dockerfile
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.
