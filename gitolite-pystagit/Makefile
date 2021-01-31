USERNAME = rilla
IMG_NAME = gitolite-pystagit

.PHONY: build build-nc

BIN=$(wildcard bin/*)
HOOKS=$(wildcard local_code/hooks/*)
TRIGGERS=$(wildcard local_code/triggers/*)

DEPS=Dockerfile $(BIN) $(HOOKS) $(TRIGGERS) gitolite.rc sshd_config

build: $(DEPS)
	docker build -t $(USERNAME)/$(IMG_NAME) .

build-nc: $(DEPS)
	docker build --no-cache -t $(USERNAME)/$(IMG_NAME) .
