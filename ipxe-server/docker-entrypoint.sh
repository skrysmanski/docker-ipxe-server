#!/bin/bash
set -e

PXE_DHCP_SUBNET="$(ifdata -pN $PXE_INTERFACE)"

IPXE_BOOT_URL="http://$(ifdata -pa $PXE_INTERFACE):${IPXE_HTTP_PORT}${IPXE_BOOT_URL_PATH}"

echo "Serving iPXE from: $IPXE_BOOT_URL"

exec /usr/sbin/dnsmasq -d \
  --interface=$PXE_INTERFACE \
  --dhcp-range=$PXE_DHCP_SUBNET,proxy \
  --dhcp-boot=tag:ipxe,$IPXE_BOOT_URL

