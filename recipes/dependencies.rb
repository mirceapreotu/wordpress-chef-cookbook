include_recipe 'apt'

%w(php5-mysql unzip).each do |package|
  apt_package package do
    action :install
  end
end