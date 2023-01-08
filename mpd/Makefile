IMG_NAME = mpd
REGISTRY = registry.monotremata.xyz
IMG = $(REGISTRY)/$(IMG_NAME)
PLATFORM = linux/amd64,linux/arm64
JOBS = 1

.PHONY: build push


out/image-name: Dockerfile
	mkdir -p $(@D)
	buildah build \
		--jobs=$(JOBS) \
		--platform=$(PLATFORM) \
		--manifest=$(IMG) .
	@echo $(IMG) > $(@)

#out/image-name: Dockerfile
#    mkdir -p $(@D)
#    podman build \
#        --manifest $(ING) \
#        --platform linux/amd64 \
#        --platform linux/arm64 \
#        .
#    @echo $(IMG) > $(@)

push: out/image-name
	podman manifest push --all $(IMG) docker://$(IMG)
