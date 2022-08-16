IMG_NAME=rainloop
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/arm64

.PHONY: build push buildx

build: Dockerfile entrypoint.sh nginx.conf
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

buildx: Dockerfile entrypoint.sh nginx.conf
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.
