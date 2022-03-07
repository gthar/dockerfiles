IMG_NAME = xandikos
REGISTRY=registry.monotremata.xyz:443

IMG=$(REGISTRY)/$(IMG_NAME)

.PHONY: build build-nc push

build: Dockerfile entrypoint.sh
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

build-nc: Dockerfile entrypoint.sh
	docker build --no-cache -t $(IMG) .
