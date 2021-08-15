FROM alpine:3.14

RUN apk add --update --no-cache \
        opensmtpd \
        opensmtpd-extras \
        rspamd \
        opensmtpd-filter-rspamd && \
    adduser \
        -h /var/vmail \
        -s /sbin/nologin \
        -u 2000 \
        -S -D \
        vmail

CMD ["smtpd", "-d"]
