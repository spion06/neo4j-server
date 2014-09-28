#
# Cookbook Name:: neo4j-server
# Recipe:: _helper
#
# Copyright (C) 2014 Kyle McGovern
#
# All rights reserved - Do Not Redistribute
#

if node['neo4j-server']['cluster.name'] 
  node.default['neo4j-server']['neo4j.properties']['ha.initial_hosts'] = get_cluster_members.map{|member| member + ':5001'}.join(',')
  node.default['neo4j-server']['neo4j.properties']['ha.server_id'] = get_server_id
end 
