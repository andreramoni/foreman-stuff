#!/bin/bash
  
. vars || ( echo "vars file not found" ; exit 1 )

#############################

#############################
echo -n "* [compute-resource create: ${COMPUTE_RESOURCE_DC1_NAME}] "
hammer compute-resource create --name "${COMPUTE_RESOURCE_DC1_NAME}" \
  --organization "${ORGANIZATION}" --locations "${LOCATION}" \
  --provider "${COMPUTE_RESOURCE_DC1_PROVIDER}" \
  --server "${COMPUTE_RESOURCE_DC1_SERVER}" \
  --user "${COMPUTE_RESOURCE_DC1_USER}" \
  --password "${COMPUTE_RESOURCE_DC1_PASSWORD}" \
  --datacenter "${COMPUTE_RESOURCE_DC1_DATACENTER}"



