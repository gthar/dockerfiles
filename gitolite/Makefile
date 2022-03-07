IMG_NAME = gitolite
REGISTRY=registry.monotremata.xyz:443
IMG=$(REGISTRY)/$(IMG_NAME)

.PHONY: build build-nc push

build: Dockerfile docker-entrypoint.sh sshd_config
	docker build -t $(IMG) .

push: build
	docker image push $(IMG)

build-nc: Dockerfile docker-entrypoint.sh sshd_config
	docker build --no-cache -t $(IMG) .
