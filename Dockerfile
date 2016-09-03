# Run via: docker run -d --network=host -p 67:67/udp -p 69:69/udp -p 4011:4011/udp ipxeboot

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y dnsmasq

COPY files /

#ENV PXE_DHCP_SUBNET 192.168.178.0
#ENV IPXE_BOOT_URL http://192.168.178.244/boot.ipxe

# All ports are UDP ports
EXPOSE 67 69 4011

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

