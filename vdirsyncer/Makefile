IMG_NAME = vdirsyncer
USERNAME = rilla
REGISTRY=registry.monotremata.xyz:443

LOCAL_IMG=$(USERNAME)/$(IMG_NAME)
REGISTRY_IMG=$(REGISTRY)/$(IMG_NAME)

.PHONY: build build-nc tag push

build: Dockerfile entrypoint.sh crontab do_sync.sh
	docker build -t $(USERNAME)/$(IMG_NAME) .

tag: build
	docker image tag $(LOCAL_IMG) $(REGISTRY_IMG)

push: tag
	docker image push $(REGISTRY_IMG)

build-nc: Dockerfile entrypoint.sh crontab do_sync.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
