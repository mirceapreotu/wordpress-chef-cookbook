nginx_path, nginx_symlink = '/usr/share/nginx/html', '/www'

execute "symlink #{ nginx_path } to #{ nginx_symlink }" do
  user "root"
  group "root"

  command "sudo ln -s #{ nginx_path } #{ nginx_symlink }"

  not_if { File.exist?(nginx_symlink) || File.symlink?(nginx_symlink) }
end

nginx_site_available_path = "#{ node[:nginx][:dir] }/sites-available/#{ node['wordpress']['name'] }"
nginx_site_enabled_path   = "#{ node[:nginx][:dir] }/sites-enabled/#{ node['wordpress']['name'] }"

template nginx_site_available_path do
  owner "root"
  group "root"

  cookbook "wordpress"
  source "wordpress.erb"
  mode 0644

  not_if { File.exists? nginx_site_available_path }
end

link nginx_site_enabled_path do
  to nginx_site_available_path

  link_type :symbolic
  notifies :reload, "service[nginx]", :delayed

  not_if { File.exists? nginx_site_enabled_path }
end