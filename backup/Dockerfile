FROM alpine:3.11

RUN apk --no-cache add squashfs-tools
COPY make_backup.sh /bin/make_backup
RUN chmod +x /bin/make_backup
CMD "/bin/make_backup"
