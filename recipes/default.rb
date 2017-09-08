#
# Cookbook Name:: magento
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory "/etc/docker/" do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

template "/etc/docker/magento.conf" do
	source "env.erb"
	mode "0666"
end

include_recipe "magento::database"
include_recipe "magento::frontend"
