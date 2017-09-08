name             'magento'
maintainer       'Ingram Micro'
maintainer_email 'imco@ingrammicro.com'
license          'All rights reserved'
description      'Installs/Configures magento'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.7'

recipe "magento", "Installs and configures magento"

%w(docker).each do |recipe_dependency|
  depends recipe_dependency
end

%w{ ubuntu debian centos redhat scientific windows }.each do |os|
  supports os
end

attribute "magento/db/host",
  :display_name => "host",
  :description => "Database host",
  :default => "mysql"

attribute "magento/db/database",
  :display_name => "database",
  :description => "Database Name",
  :default => "magento"

attribute "magento/db/username",
  :display_name => "username",
  :description => "Database Username",
  :default => "magentouser"

attribute "magento/db/sample_data",
  :display_name => "sample_data",
  :description => "Database Sample Data",
  :default => "false"

attribute "magento/dir",
  :display_name => "dir",
  :description => "Magento install dir",
  :default => "/var/www/magento"

attribute "mysql/dir",
  :display_name => "dir",
  :description => "Mysql install dir",
  :default => "/var/lib/mysql"

attribute "mysql/root_password",
  :display_name => "root_password",
  :description => "Mysql root password",
  :default => "mysqlmagentopassword"

  attribute "magento/locale",
    :display_name => "locale",
    :description => "Magento locale",
    :default => "en_US"

  attribute "magento/timezone",
    :display_name => "timezone",
    :description => "Magento timezone",
    :default => "America/Los_Angeles"

  attribute "magento/version",
    :display_name => "version",
    :description => "Magento Version",
    :default => "latest"

  attribute "magento/user/firstname",
    :display_name => "firstname",
    :description => "Magento Admin User Firstname",
    :default => "admin"

  attribute "magento/user/lastname",
    :display_name => "lastname",
    :description => "Magento Admin User Lastname",
    :default => "MyStore"

  attribute "magento/user/username",
    :display_name => "username",
    :description => "Magento Admin Username",
    :default => "admin"

  attribute "magento/user/password",
    :display_name => "password",
    :description => "Magento Admin Password",
    :default => "magentorocks1"

  attribute "magento/user/email",
    :display_name => "email",
    :description => "Magento email",
    :default => "admin@admin.com"
