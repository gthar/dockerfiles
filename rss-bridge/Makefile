IMG_NAME = rss-bridge
REGISTRY=registry.monotremata.xyz:443

IMG=$(REGISTRY)/$(IMG_NAME)

.PHONY: build build-nc push

build: Dockerfile
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

build-nc: Dockerfile
	docker build --no-cache -t $(IMG) .
