images=agate archivebox ansible backup buku ddclient git-daemon gitolite gitolite-pystagit rss-bridge pleroma sassc syncthing tasks tor transmission vdirsyncer xandikos nfs-server dendrite rainloop

.PHONY: all $(images)
all: $(images)

BUILD = make -C $@

agate:
	$(BUILD)

archivebox:
	$(BUILD)

ansible:
	$(BUILD)

backup:
	$(BUILD)

buku:
	$(BUILD)

ddclient:
	$(BUILD)

git-daemon:
	$(BUILD)

gitolite:
	$(BUILD)

gitolite-pystagit:
	$(BUILD)

nfs-server:
	$(BUILD)

rss-bridge:
	$(BUILD)

pleroma:
	$(BUILD)

sassc:
	$(BUILD)

syncthing:
	$(BUILD)

tasks:
	$(BUILD)

tor:
	$(BUILD)

transmission:
	$(BUILD)

vdirsyncer:
	$(BUILD)

xandikos:
	$(BUILD)

dendrite:
	$(BUILD)

rainloop:
	$(BUILD)
