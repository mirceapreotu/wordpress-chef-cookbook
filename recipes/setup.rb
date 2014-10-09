include_recipe "mysql::server"
include_recipe "wordpress::#{ node['wordpress']['platform'] }_setup"

def restart_mysql
  execute "restart mysql - make sure it's running" do
    user "root"
    group "root"

    command "sudo service mysql restart"
  end
end  

project_name   = node['wordpress']['name']
files          = node['wordpress']['sources']['files']
database       = node['wordpress']['sources']['database']
config_options = node['wordpress']['options']
config_path    = "/www/#{ project_name }/wp-config.php"

execute "copy wordpress source files" do
  user "root"
  group "root"

  install_path = "/www/#{ project_name }"

  commands = []
  commands << "cd /tmp"
  commands << "sudo wget -q #{ files } -O wordpress.zip"
  commands << "sudo unzip wordpress.zip -d /www"
  commands << "sudo mv /www/wordpress #{ install_path }"

  command commands.join(' && ')

  not_if { File.directory?(install_path) }
end

template config_path do
  owner "root"
  group "root"

  cookbook "wordpress"
  source "wp-config.php.erb"
  mode 0644

  not_if { File.exists? config_path }
end

restart_mysql

execute "create database" do
  user "root"
  group "root"

  statement = "DROP DATABASE IF EXISTS #{ config_options['db_name'] } ; CREATE DATABASE #{ config_options['db_name'] } DEFAULT CHARACTER SET #{ config_options['db_charset'] };"

  command "mysql -u #{ config_options['db_user'] } -p\"#{ config_options['db_password'] }\" -e \"#{ statement }\";"
end


execute "import database from #{ database }" do
  user "root"
  group "root"

  commands = []
  commands << "cd /tmp"
  commands << "sudo wget -q #{ database } -O wordpress.sql"
  commands << "sudo mysql -u #{ config_options['db_user'] } -p\"#{ config_options['db_password'] }\" #{ config_options['db_name'] } < /tmp/wordpress.sql;"

  command commands.join(' && ')
end unless database.empty?

restart_mysql