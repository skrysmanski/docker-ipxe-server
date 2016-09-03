#!/bin/bash
set -e

echo "Serving iPXE from: $IPXE_BOOT_URL"

exec /usr/sbin/dnsmasq -d \
  --dhcp-range=$PXE_DHCP_SUBNET,proxy \
  --dhcp-boot=tag:ipxe,$IPXE_BOOT_URL

