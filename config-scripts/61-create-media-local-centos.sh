#!/bin/bash

. vars || ( echo "vars file not found" ; exit 1 )


#############################
echo -n "* [medium create: CentOS7 local] "
hammer medium create --name "CentOS local" \
  --organization "${ORGANIZATION}" \
  --os-family "Redhat" \
  --path "http://${FOREMAN_HOSTNAME}/pulp/repos/${ORGANIZATION}/Library/custom/CentOS7/CentOS7_base/" \
  --locations "${LOCATION}"

#############################
echo -n "* [os update: ID 1 media CentOS local] "
hammer os update --id 1 --media "CentOS local"


