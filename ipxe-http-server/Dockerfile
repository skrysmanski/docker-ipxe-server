FROM alpine

RUN apk add --update lighttpd \
 && rm -rf /var/cache/apk/*

COPY lighttpd.conf /

EXPOSE 3000

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

