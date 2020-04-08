FROM alpine:3.12

ENV VERSION 3.9.1
ENV DL_URL https://github.com/ddclient/ddclient/archive/v${VERSION}.tar.gz
#ENV PERL_MM_USE_DEFAULT 1

RUN apk add --no-cache \
        curl make wget \
        perl perl-utils perl-test-taint perl-netaddr-ip perl-net-ip \
        perl-yaml perl-log-log4perl perl-io-socket-ssl && \
    curl -L http://cpanmin.us | perl - Data::Validate::IP && \
    tmp=$(mktemp -d) && \
    curl -L "${DL_URL}" --output "${tmp}/ddclient.tar.gz" && \
    tar -xzf "${tmp}/ddclient.tar.gz" -C "${tmp}" && \
    cp "${tmp}/ddclient-${VERSION}/ddclient" /usr/bin/ddclient && \
    rm -r "${tmp}" && \
    mkdir -p /etc/ddclient /var/cache/ddclient

CMD ["/usr/bin/ddclient", "-foreground"]
