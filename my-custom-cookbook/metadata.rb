name             'my-custom-cookbook'
maintainer       'Paul Allen'
maintainer_email 'cloud-devops@cornell.edu'
license          'All rights reserved'
description      'Installs/Configures Example for OpsWorks deployment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends          'aws'
depends          'opsworks-utils-cookbook'
gem              'aws-sdk-core'
gem              'cucloud'