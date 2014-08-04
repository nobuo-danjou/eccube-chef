include_recipe 'apache2'
include_recipe 'php'
include_recipe 'mysql::server'
include_recipe 'database::mysql'
include_recipe 'iptables'

root_connection = {
  :host => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node['eccube']['db_name'] do
  connection root_connection
  encoding 'UTF8'
  action :create
end

mysql_database_user node['eccube']['db_user'] do
  connection root_connection
  database_name node['eccube']['db_name']
  password node['eccube']['db_password']
  privileges [:all]
  action :grant
end

basename = File.basename(node['eccube']['source'])
tarball = File.join(Chef::Config['file_cache_path'], basename)
install_dir = node['eccube']['install_dir']
parent = Pathname.new(install_dir).parent.to_s

remote_file tarball do
  source node['eccube']['source']
end

directory parent do
  action :create
  recursive true
end

script 'install eccube' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-END
    tar xzvf #{tarball}
    mv #{File.basename(tarball, '.tar.gz')} #{install_dir}
  END
  not_if { Dir.exists?(install_dir) }
end

web_app 'eccube' do
  server_name node['eccube']['server_name']
  docroot File.join(install_dir,'html')
end

iptables_rule 'apache' do
  source 'iptables.erb'
end
