#!/bin/bash
curl https://raw.githubusercontent.com/andreyev/one-vagrantfile-to-rule-them-all/first-commit/puppet-installer | bash
LIBRARIAN_PUPPET_PATH=/opt/puppetlabs/modules LIBRARIAN_PUPPET_TMP=/opt/puppetlabs/tmp /opt/puppetlabs/puppet/bin/librarian-puppet install --verbose
/opt/puppetlabs/bin/puppet apply --modulepath /opt/puppetlabs/modules  init.pp
