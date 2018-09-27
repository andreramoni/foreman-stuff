#!/bin/bash
  
. vars || ( echo "vars file not found" ; exit 1 )

#############################

hammer global-parameter set --name "disable-firewall" --value "$GPAR_DISABLE_FIREWALL"
hammer global-parameter set --name "enable-puppetlabs-pc1-repo" --value "$GPAR_PUPPETLABS_PC1_REPO"
hammer global-parameter set --name "kt_activation_keys" --value "$GPAR_ACTIVATION_KEYS"
hammer global-parameter set --name "selinux-mode" --value "$GPAR_SELINUX_MODE"
hammer global-parameter set --name "runinterval" --value "$GPAR_PUPPET_RUNINTERVAL"
