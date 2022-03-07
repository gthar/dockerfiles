FROM alpine:3.14

RUN apk add --update --no-cache \
        docker-compose \
        docker \
        git \
        openssh-server \
        perl  \
        shadow \
        su-exec

RUN adduser -h /var/lib/git -D git && \
    adduser git docker && \
    mkdir -p /var/lib/git/local/hooks && \
    chown -R git:git /var/lib/git && \
    usermod -p '*' git && \
    passwd -u git

RUN mkdir -p /usr/local/src && \
    git clone https://github.com/sitaramc/gitolite /usr/local/src/gitolite && \
    /usr/local/src/gitolite/install -ln /usr/local/bin

RUN mkdir -p /opt/docker-services

COPY sshd_config /etc/ssh/sshd_config

VOLUME /etc/ssh/keys
VOLUME /var/lib/git

COPY docker-entrypoint.sh /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
