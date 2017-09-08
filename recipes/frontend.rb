#
# Cookbook Name:: magento
# Recipe:: frontend
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  action [:create, :start]
end

docker_image 'ingrammicro/magento' do
  tag (node[:magento][:version]).to_s
  action :pull
end

docker_container 'magento' do
  repo 'ingrammicro/magento'
  tag (node[:magento][:version]).to_s
  port '80:80'
  host_name 'www'
  env [
    "MYSQL_ROOT_PASSWORD=#{node[:mysql][:root_password]}",
    "MYSQL_HOST=#{node[:magento][:db][:host]}",
    "MYSQL_DATABASE=#{node[:magento][:db][:datbase]}",
    "MYSQL_USER=#{node[:magento][:db][:username]}",
    "MYSQL_PASSWORD=#{node[:magento][:db][:password]}",
    "MAGENTO_LOCALE=#{node[:magento][:locale]}",
    "MAGENTO_TIMEZONE=#{node[:magento][:timezone]}",
    "MAGENTO_DEFAULT_CURRENCY=#{node[:magento][:currency]}",
    "MAGENTO_URL=#{node[:magento][:host]}",
    "MAGENTO_ADMIN_FIRSTNAME=#{node[:magento][:user][:firstname]}",
    "MAGENTO_ADMIN_LASTNAME=#{node[:magento][:user][:lastname]}",
    "MAGENTO_ADMIN_EMAIL=#{node[:magento][:user][:email]}",
    "MAGENTO_ADMIN_USERNAME=#{node[:magento][:user][:username]}",
    "MAGENTO_ADMIN_PASSWORD=#{node[:magento][:user][:password]}"
  ]
  links ['mysql:mysql'] if node[:magento][:db][:host] == 'mysql'
  action :run_if_missing
end

execute 'Configure Magento' do
  command 'docker exec -i magento /usr/local/bin/install-magento'
  timeout 360
  not_if { ::File.exist?("/etc/docker/magento.install.true") }
end

file "/etc/docker/magento.install.true" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
