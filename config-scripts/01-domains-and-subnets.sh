#!/bin/bash

. vars || ( echo "vars file not found" ; exit 1 )

#############################
echo -n "* [domain update: ${EXT_DOMAIN}] "
echo hammer domain update \
  --name "${EXT_DOMAIN}" \
  --organizations "${ORGANIZATION}" --locations "${LOCATION}"

echo -n "* [subnet create: ${EXT_NETWORK_NAME} - ${EXT_NETWORK_ADDRESS}] "
echo hammer subnet create \
  --name "${EXT_NETWORK_NAME}" \
  --network "${EXT_NETWORK_ADDRESS}" \
  --mask "${EXT_NETWORK_NETMASK}" \
  --gateway "${EXT_NETWORK_GATEWAY}" \
  --boot-mode "Static" \
  --from "${EXT_NETWORK_RANGE_FROM}" \
  --to "${EXT_NETWORK_RANGE_TO}" \
  --domains "${EXT_DOMAIN}" \
  --dns-primary "${EXT_DNS1}" \
  --ipam "Internal DB" \
  --organizations "${ORGANIZATION}" \
  --locations "${LOCATION}"


