IMG_NAME = pleroma
REGISTRY = registry.monotremata.xyz
IMG = $(REGISTRY)/$(IMG_NAME)
PLATFORM = linux/amd64
JOBS = 1

.PHONY: push

out/image-name: Dockerfile entrypoint.sh
	mkdir -p $(@D)
	buildah build \
		--jobs=$(JOBS) \
		--platform=$(PLATFORM) \
		--manifest=$(IMG) .
	@echo $(IMG) > $(@)

push: out/image-name
	podman manifest push --all $(IMG) docker://$(IMG)
