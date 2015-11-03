#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

Chef::Log.level = :debug

configsrvs = search(
  :node,
  "mongodb_cluster_name:#{node['mongodb']['cluster_name']} AND \
   mongodb_is_configserver:true AND \
   chef_environment:#{node.chef_environment}"
)

Chef::Log.debug "configsrvs 1:#{configsrvs}"

configsrvs = search(
  :node,
  "mongodb_cluster_name:#{node['mongodb']['cluster_name']} AND \
   mongodb_is_configserver:true"
)

Chef::Log.debug "configsrvs 2:#{configsrvs}"

configsrvs = search(
  :node,
  "mongodb_cluster_name:#{node['mongodb']['cluster_name']}"
)

Chef::Log.debug "configsrvs 3:#{configsrvs}"

include_recipe 'mongodb::mongos'