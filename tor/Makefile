IMG_NAME=tor
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64

.PHONY: build push buildx

build: Dockerfile entrypoint.sh
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

buildx: Dockerfile entrypoint.sh
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.
