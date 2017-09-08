# General settings
default[:magento][:version] = 'latest'
default[:mysql][:dir] = '/var/lib/mysql'

default[:magento][:db][:sample_data] = false
default[:magento][:db][:host] = 'mysql'
default[:magento][:db][:datbase] = 'magento'
default[:magento][:db][:username] = 'magentouser'
default[:magento][:db][:password] = 'magentopassword'
default[:mysql][:root_password] = 'mysqlmagentopassword'

default[:magento][:locale] = 'en_US'
default[:magento][:timezone] = 'America/Los_Angeles'
default[:magento][:currency] = 'USD'
default[:magento][:host] = "http://#{node['hostname']}.#{node['domain']}/"
default[:magento][:user][:firstname] = 'admin'
default[:magento][:user][:lastname] = 'MyStore'
default[:magento][:user][:email] = 'admin@admin.com'
default[:magento][:user][:username] = 'admin'
default[:magento][:user][:password] = 'magentorocks1'
