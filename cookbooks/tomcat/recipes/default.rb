#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe 'yum-epel'
include_recipe 'java'

package 'tomcat' do
  action :install
end

template "/etc/tomcat/server.xml" do
  source "server.xml.erb"
  user 'tomcat'
  group 'tomcat'
  action :create
end

template "/usr/share/tomcat/conf/server.xml" do
  source "server.xml.erb"
  user 'tomcat'
  group 'tomcat'
  action :create
end

service 'tomcat' do
  action [ :enable, :start ]
end
