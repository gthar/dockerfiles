IMG_NAME=rompr
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/arm64

.PHONY: build push buildx

build: Dockerfile nginx.conf services.d/nginx/run
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

buildx: Dockerfile nginx.conf services.d/nginx/run
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.
