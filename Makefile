images=backup buku ddclient gitolite gitolite-pystagit git-daemon rss-bridge sassc syncthing tasks tor vdirsyncer xandikos
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
