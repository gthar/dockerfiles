# Dockerfiles

Collection of docker images for my personal use. I usually implement my own
docker images if I don't find one built or recommended by the original
developer of the software I intend to run. Or if the recommended one is too
complex for my specific use case. Or if I don't like it for whatever reason. Or
if I just feel like making my own image.

All images are made to suit my specific needs and taste, not to be generally
useful.

I use simple Makefiles to build the images for the architectures I care about
(linux/amd64 and linux/arm64) using `docker buildx` and push them to my private
docker registry.

## Currently implemented images:

* agate
* mpd
* pleroma
* rainloop
* tor
* transmission
* webdav (really simple nginx + `nginx-mod-http-dav-ext` image)

## Enable multi-arch execution

```sh
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```
