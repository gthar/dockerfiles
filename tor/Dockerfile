FROM alpine:3.12

RUN apk add --no-cache tor su-exec shadow
COPY entrypoint.sh /entrypoint
RUN chmod +x entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["tor"]
