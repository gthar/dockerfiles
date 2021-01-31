FROM alpine:3.13

RUN apk add --no-cache \
        gitolite \
        libgit2 \
        openssh-server \
        python3 \
        su-exec && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        libffi-dev \
        libgit2-dev \
        musl-dev \
        py3-pip \
        python3-dev && \
    git clone https://github.com/gthar/pystagit.git /tmp/pystagit && \
    pip install /tmp/pystagit && \
    rm -r /tmp/pystagit && \
    apk del .build-deps && \
    passwd -u git && \
    mkdir -p /opt/gitolite-local/hooks/common

COPY sshd_config /etc/ssh/sshd_config
COPY gitolite.rc /var/lib/git/.gitolite.rc

COPY bin/. /usr/local/bin/
COPY local_code/. /opt/gitolite-local/

RUN chown -R git:git /var/lib/git && \
    chmod +x \
        /usr/local/bin/entrypoint \
        /usr/local/bin/build-pystagit-index \
        /usr/local/bin/build-pystagit-repo \
        /usr/local/bin/build-pystagit-repos \
        /opt/gitolite-local/hooks/common/post-receive \
        /opt/gitolite-local/triggers/build-pystagit-index \
        /opt/gitolite-local/triggers/build-pystagit-repo \
        /opt/gitolite-local/triggers/build-pystagit-repos

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
