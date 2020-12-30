# Dockerfiles

Collection of docker images for my personal use. I usually implement my own
docker images if I don't find one built or recommended by the original
developer of the software I intend to run.

Simply run `make $IMG_NAME` to build a specific image or run `make` to build them
all.
The created images are named as `rilla/$IMG_NAME`.

All images are made to suit my specific needs and taste, not to be generally
useful.

## Currently implemented images:

(many are self-explanatory)

* ansible
* backup: simple image used in some of my backup daemons
* buku: buku and bukuserver
* ddclient
* git-daemon: for git-daemon and git-http-backend
* gitolite-stagit: well, gitolite + stagit
* gitolite: gitolite + docker, so that I can mount the docker socket inside of
  it and have it do useful things through docker in response to triggers
* ledger-web
* syncthing
* tasks: intended to run a cron daemon to run arbitrary periodic tasks. I mount
  the docker socket inside of it to have it perform maintanance tasks outside
  of it's container.
* vdirsyncer
* wallabag
* xandikos
