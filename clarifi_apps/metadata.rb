name 'clarifi_apps'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures clarifi_apps'
long_description 'Installs/Configures clarifi_apps'
version '0.1.0'

depends 'mongodb'
depends 'elasticsearch', '~> 0.3.14'
depends 'rabbitmq'
depends "route53"