#
# Cookbook Name:: neo4j-server
# Recipe:: default
#
# Copyright (C) 2014 Kyle McGovern
#
# All rights reserved - Do Not Redistribute
#

include_recipe "neo4j-server::_helper"

yum_repository 'neo4j-server' do
  description 'Yum repository for neo4j-server'
  baseurl node['neo4j-server']['yum.url']
  gpgkey node['neo4j-server']['gpg.key.url']
  action :create
end

package 'neo4j' do
  action [:install, :upgrade]
end

template '/etc/neo4j/neo4j-server.properties' do
  source 'server.properties.erb'
  variables ({
    :properties => node['neo4j-server']['neo4j.server.properties']
  })
  notifies :restart , 'service[neo4j]'
end

template '/etc/neo4j/neo4j.properties' do
  source 'server.properties.erb'
  variables ({
    :properties => node['neo4j-server']['neo4j.properties']
  })
  notifies :restart , 'service[neo4j]'
end

template '/etc/sysconfig/neo4j' do
  source 'server.properties.erb'
  variables ({
    :properties => node['neo4j-server']['sysconfig']
  })
  notifies :restart , 'service[neo4j]'
end

service 'neo4j' do
  action [:start,:enable]
end
