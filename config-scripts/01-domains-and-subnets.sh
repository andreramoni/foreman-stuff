#!/bin/bash

. vars || ( echo "vars file not found" ; exit 1 )

#############################
echo -n "* [domain update: ${EXT_DOMAIN}] "
hammer domain update \
  --name "${EXT_DOMAIN}" \
  --organizations "${ORGANIZATION}" --locations "${LOCATION}"

echo -n "* [subnet create: ${EXT_NETWORK_NAME} - ${EXT_NETWORK_ADDRESS}] "
hammer subnet create \
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

#############################
if [ "$USE_PROV_NETWORK" == "true" ]; then
  echo -n "* [domain create: ${PROV_DOMAIN}] "
  hammer domain create --name "${PROV_DOMAIN}" --organizations "${ORGANIZATION}" --locations "${LOCATION}"

  echo -n "* [subnet create: ${PROV_NETWORK_NAME} - ${PROV_NETWORK_ADDRESS}] "
  hammer subnet create \
    --name "${PROV_NETWORK_NAME}" \
    --network "${PROV_NETWORK_ADDRESS}" \
    --mask "${PROV_NETWORK_NETMASK}" \
    --gateway "${PROV_NETWORK_GATEWAY}" \
    --boot-mode "DHCP" \
    --from "${PROV_NETWORK_RANGE_FROM}" \
    --to "${PROV_NETWORK_RANGE_TO}" \
    --domains "${PROV_DOMAIN}" \
    --ipam "DHCP" \
    --organizations "${ORGANIZATION}" \
    --locations "${LOCATION}"

fi

