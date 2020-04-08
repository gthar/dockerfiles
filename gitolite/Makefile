USERNAME = rilla
IMG_NAME = gitolite

.PHONY: build build-nc

build: Dockerfile docker-entrypoint.sh sshd_config
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: Dockerfile docker-entrypoint.sh sshd_config
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
