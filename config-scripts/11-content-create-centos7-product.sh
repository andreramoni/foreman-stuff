#!/bin/bash
  
. vars || ( echo "vars file not found" ; exit 1 )

#############################

#############################
echo -n "* [sync-plan create: Daily] "
hammer sync-plan create --interval 'daily' --name 'Daily' --enabled 'yes'  --organization "${ORGANIZATION}" --sync-date "`date -I`" 


#############################
echo -n "* [product create: CentOS7] "
hammer product create --name "CentOS7" --organization "${ORGANIZATION}" --sync-plan 'Daily'

echo -n "* [repository create: CentOS7|CentOS7 base] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "CentOS7 base" \
  --url "http://mirror.centos.org/centos/7/os/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}" 

echo -n "* [repository create: CentOS7|CentOS7 extras] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "CentOS7 extras" \
  --url "http://mirror.centos.org/centos/7/extras/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}"

echo -n "* [repository create: CentOS7|CentOS7 updates] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "CentOS7 updates" \
  --url "http://mirror.centos.org/centos/7/updates/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}"

echo -n "* [repository create: CentOS7|Epel 7] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "Epel 7" \
  --url "http://download.fedoraproject.org/pub/epel/7/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}"

echo -n "* [repository create: CentOS7|Katello Client ${KATELLO_VERSION}] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "Katello Client ${KATELLO_VERSION}" \
  --url "https://fedorapeople.org/groups/katello/releases/yum/${KATELLO_VERSION}/client/el7/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}"

echo -n "* [repository create: CentOS7|Puppet 4 PC1] "
hammer repository create --product="CentOS7" \
  --content-type="yum" --name "Puppet 4 PC1" \
  --url "http://yum.puppetlabs.com/el/7/PC1/x86_64" \
  --download-policy "on_demand" --organization "${ORGANIZATION}"

#############################
echo -n "* [repository synchronize: CentOS7 base] "
hammer repository synchronize --name "CentOS7 base" --product "CentOS7" --organization "${ORGANIZATION}" --async

echo -n "* [repository synchronize: CentOS7 extras] "
hammer repository synchronize --name "CentOS7 extras" --product "CentOS7" --organization "${ORGANIZATION}"  --async

echo -n "* [repository synchronize: CentOS7 updates] "
hammer repository synchronize --name "CentOS7 updates" --product "CentOS7" --organization "${ORGANIZATION}"  --async

echo -n "* [repository synchronize: Katello Client ${KATELLO_VERSION}] "
hammer repository synchronize --name "Katello Client ${KATELLO_VERSION}" --product "CentOS7" --organization "${ORGANIZATION}"  --async

echo -n "* [repository synchronize: Epel 7] "
hammer repository synchronize --name "Epel 7" --product "CentOS7" --organization "${ORGANIZATION}"  --async

echo -n "* [repository synchronize: Puppet 4 PC1] "
hammer repository synchronize --name "Puppet 4 PC1" --product "CentOS7" --organization "${ORGANIZATION}"  --async

#############################
echo -n "* [content-view create: CentOS7] "
hammer content-view create --name "CentOS7" --organization "${ORGANIZATION}"  --product "CentOS7" --repositories "CentOS7 base,CentOS7 extras,CentOS7 updates,Epel 7,Katello Client ${KATELLO_VERSION},Puppet 4 PC1"

echo -n "* [content-view publish: CentOS7] "
hammer content-view publish --name "CentOS7" --organization "${ORGANIZATION}"

#############################
echo -n "* [activation-key create: CentOS7] "
hammer activation-key create --content-view "CentOS7" --name "CentOS7" --lifecycle-environment "Library" --organization "${ORGANIZATION}"
hammer activation-key add-subscription --name "CentOS7" --subscription-id 1 --organization "${ORGANIZATION}"


