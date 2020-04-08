FROM alpine:3.12

RUN apk add --no-cache openssh python3 py3-pip && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        libffi-dev \
        musl-dev \
        openssl-dev \
        python3-dev && \
    pip install \
        ansible==2.9 \
        cryptography \
        mitogen && \
    apk del .build-deps

RUN apk add --no-cache openssl

COPY get_password.sh /usr/local/bin/get_password
RUN chmod +x /usr/local/bin/get_password

COPY ansible.cfg /etc/ansible/ansible.cfg

RUN mkdir -p /srv
WORKDIR /srv
