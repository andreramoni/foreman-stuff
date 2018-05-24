sleep 5
FCB=$(/usr/bin/curl -k 'http://foreman.ext.lab/unattended/built' 2> /dev/null)
ST=$?

if [ $ST -eq 0 -a "$FCB" == "" ]; then
  echo "Running finish deploy script..."
  yum -y install https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
  yum -y install puppet-agent
  . /etc/profile
  puppet agent -t --server foreman.ext.lab
  rm /root/foreman_finish_deploy.sh
else
  echo "Not a deployed host, ensuring finish script..."
  ln -s /root/finish.sh /root/foreman_finish_deploy.sh 2> /dev/null
fi

