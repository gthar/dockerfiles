FROM alpine:3.16

RUN apk --no-cache add dnsmasq

VOLUME /etc/dnsmasq

EXPOSE 53

CMD ["dnsmasq", "--no-daemon"]
