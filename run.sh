#!/bin/bash
OS_MAJ_VERSION=$(rpm -qa \*-release | grep -Ei "centos" | cut -d"-" -f3)
[[ -z "$OS_MAJ_VERSION" ]] && { echo "Distro not supported"; exit 1;}
yum install -y https://yum.puppetlabs.com/puppetlabs-release-pc1-el-"$OS_MAJ_VERSION".noarch.rpm
yum install -y puppet git

git clone https://github.com/andreyev/basic-elasticstack-puppet.git

cd basic-elasticstack-puppet
/opt/puppetlabs/puppet/bin/gem install  librarian-puppet

LIBRARIAN_PUPPET_PATH=/opt/puppetlabs/modules LIBRARIAN_PUPPET_TMP=/opt/puppetlabs/tmp /opt/puppetlabs/puppet/bin/librarian-puppet install --verbose
/opt/puppetlabs/bin/puppet apply --modulepath /opt/puppetlabs/modules  init.pp
