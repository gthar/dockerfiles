# maybe switch to a stable version of alpine once tidyhtml is avaiblable there
FROM alpine:edge

# py3-pip is only needed to install j2cli, but python3 and py3-setuptools are
# also needed to run it
RUN apk add --no-cache \
        findutils \
        make \
        py3-pip \
        py3-setuptools \
        python3 \
        sassc \
        tidyhtml && \
    pip install j2cli[yaml] && \
    apk del py3-pip
