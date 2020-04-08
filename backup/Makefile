USERNAME = rilla
IMG_NAME = backup

.PHONY: build build-nc

build: Dockerfile make_backup.sh
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile make_backup.sh
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
