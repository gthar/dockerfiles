IMG_NAME=pleroma
REGISTRY=registry.monotremata.xyz
IMG=$(REGISTRY)/$(IMG_NAME)
PLATFORMS=linux/amd64

.PHONY: push buildx

out/image-name: Dockerfile entrypoint.sh
	mkdir -p $(@D)
	docker build -t $(IMG) .
	@echo $(IMG) > $(@)

push: out/image-name
	docker image push $(IMG)

buildx: Dockerfile entrypoint.sh
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMG) \
		--push \
		.
