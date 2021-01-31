images=backup buku ddclient gitolite gitolite-pystagit git-daemon rss-bridge syncthing tasks tor vdirsyncer wallabag xandikos
.PHONY: all $(images)
all: $(images)

BUILD = make -C $@

backup:
	$(BUILD)

buku:
	$(BUILD)

ddclient:
	$(BUILD)

gitolite:
	$(BUILD)

gitolite-pystagit:
	$(BUILD)

git-daemon:
	$(BUILD)

rss-bridge:
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

wallabag:
	$(BUILD)
