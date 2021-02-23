images=agate archivebox ansible backup buku ddclient git-daemon gitolite gitolite-pystagit rss-bridge pleroma sassc syncthing tasks tor vdirsyncer xandikos
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

vdirsyncer:
	$(BUILD)

xandikos:
	$(BUILD)
