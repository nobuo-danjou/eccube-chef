default['eccube']['source'] = 'http://downloads.ec-cube.net/src/eccube-2.13.2.tar.gz'
default['eccube']['db_name'] = 'eccube_db'
default['eccube']['db_user'] = 'eccube_db_user'
default['eccube']['db_password'] = 'eccube'
default['eccube']['install_dir'] = '/var/www/eccube'
default['eccube']['server_name'] = node['fqdn']

default['php']['packages'] = %w{
  php php-devel php-cli php-mbstring php-pear php-mysql
}
default['php']['directives'] = { "date.timezone" => "Asia/Tokyo" }
