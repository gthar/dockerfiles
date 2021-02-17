images=ansible backup buku ddclient git-daemon gitolite gitolite-pystagit rss-bridge sassc syncthing tasks tor vdirsyncer xandikos
.PHONY: all $(images)
all: $(images)

BUILD = make -C $@

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
