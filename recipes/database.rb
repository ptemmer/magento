#
# Cookbook Name:: magento
# Recipe:: database
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
docker_service 'default' do
  action [:create, :start]
end

directory (node[:mysql][:dir]).to_s do
  owner 'root'
  group 'docker'
  mode '0755'
  recursive true
  action :create
end

docker_image 'mysql' do
  tag '5.6.23'
  action :pull
end

docker_container 'mysql' do
  repo 'mysql'
  tag '5.6.23'
  host_name 'mysql'
  env [
    "MYSQL_ROOT_PASSWORD=#{node[:mysql][:root_password]}",
    "MYSQL_HOST=#{node[:magento][:db][:host]}",
    "MYSQL_DATABASE=#{node[:magento][:db][:datbase]}",
    "MYSQL_USER=#{node[:magento][:db][:username]}",
    "MYSQL_PASSWORD=#{node[:magento][:db][:password]}"
  ]
  port '3306:3306' unless node[:magento][:db][:host] == 'mysql'
  volumes ["#{node[:mysql][:dir]}:/var/lib/mysql"]
end

if node[:magento][:db][:sample_data]
  docker_exec 'Sample Data' do
    container 'magento'
    command ['install-sampledata']
    not_if { ::File.exist?("/etc/docker/magento.sample.data.true") }
  end

  file "/etc/docker/magento.sample.data.true" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end
