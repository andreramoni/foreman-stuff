#!/bin/bash
  
. vars || ( echo "vars file not found" ; exit 1 )

#############################

hammer settings set --name "entries_per_page" --value "$SET_ENTRIES_PER_PAGE"
hammer settings set --name "puppet_server" --value "$FOREMAN_HOSTNAME"
hammer settings set --name "remote_execution_connect_by_ip" --value "$SET_REMOTE_EXECUTION_BY_IP"

