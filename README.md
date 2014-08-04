# eccube-che

## platforms

I only tested with Centos6.5 vagrant, but it will be okay with Amazon Linux.

## requirements

```
depends 'apache2'
depends 'php'
depends 'mysql'
depends 'database'
depends 'iptables'
```

## attributes

```
default['eccube']['source'] = 'http://downloads.ec-cube.net/src/eccube-2.13.2.tar.gz'
default['eccube']['db_name'] = 'eccube_db'
default['eccube']['db_user'] = 'eccube_db_user'
default['eccube']['db_password'] = 'eccube'
default['eccube']['install_dir'] = '/var/www/eccube'
default['eccube']['server_name'] = node['fqdn']
```

## author

Nobuo Danjou <danjou@soffritto.org>
