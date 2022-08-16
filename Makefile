REGISTRY=registry.monotremata.xyz
PLATFORMS=linux/amd64,linux/arm64

IMAGES=agate mpd pleroma rainloop tor transmission webdav

.PHONY: all $(IMAGES)

all: $(IMAGES)

BUILDX=make -C $@ buildx
# BUILDX=docker buildx build --platform $(PLATFORMS) --tag $(REGISTRY)/$@ --push $@

agate:
	$(BUILDX)

mpd:
	$(BUILDX)

pleroma:
	$(BUILDX)

rainloop:
	$(BUILDX)

tor:
	$(BUILDX)

transmission:
	$(BUILDX)

webdav:
	$(BUILDX)
