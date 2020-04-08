USERNAME = rilla
IMG_NAME = vdirsyncer

.PHONY: build build-nc

build: Dockerfile entrypoint.sh crontab do_sync.sh
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile entrypoint.sh crontab do_sync.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
