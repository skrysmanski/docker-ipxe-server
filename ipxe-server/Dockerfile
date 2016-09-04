# Run via: docker run -d --network=host -p 67:67/udp -p 69:69/udp -p 4011:4011/udp ipxeboot

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends dnsmasq moreutils

COPY files /

ENV PXE_INTERFACE=eth0 \
    IPXE_BOOT_URL_PATH=/boot.ipxe \
    IPXE_HTTP_PORT=80

# All ports are UDP ports
EXPOSE 67 69 4011

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

