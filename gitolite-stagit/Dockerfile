FROM alpine:3.12

RUN apk add --no-cache \
        gitolite \
        openssh-server \
        su-exec \
        libgit2 && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        make \
        musl-dev \
        libgit2-dev && \
    git clone git://git.codemadness.org/stagit /tmp/stagit && \
    make -C /tmp/stagit && \
    make -C /tmp/stagit install && \
    rm -r /tmp/stagit && \
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
        /usr/local/bin/build-stagit-index \
        /usr/local/bin/build-stagit-repo \
        /usr/local/bin/build-stagit-repos \
        /opt/gitolite-local/hooks/common/post-receive \
        /opt/gitolite-local/triggers/build-stagit-index \
        /opt/gitolite-local/triggers/build-stagit-repo \
        /opt/gitolite-local/triggers/build-stagit-repos

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
