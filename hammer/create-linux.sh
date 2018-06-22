#!/bin/bash

# https://github.com/theforeman/hammer-cli-foreman/blob/master/doc/host_create.md

hammer host create \
  --hostgroup=Linux \
  --compute-resource=VMwareLAB \
  --compute-attributes="cpus=1,start=1" \
  --name="linux01" \
  --partition-table="Kickstart default" \
  --medium="CentOS mirror" \
  --provision-method=build \
  --operatingsystem-id="1"

