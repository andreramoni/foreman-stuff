#!/bin/bash
hammer host create \
  --hostgroup=Windows \
  --compute-resource=ATL1-VMware \
  --compute-attributes="cpus=2,start=1" \
  --name="windows01" \
  --partition-table="fake" \
  --medium="fake" \
  --provision-method=image \
  --image="Win2016" \
  --operatingsystem-id="2"

