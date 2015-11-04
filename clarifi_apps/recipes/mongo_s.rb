#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

Chef::Log.level = :debug

config_instances = []
Chef::Log.debug "Found instances found for mongoconfig layer : #{node[:opsworks][:layers]['mongo-config'][:instances]}"

node["opsworks"]["layers"]["mongo-config"]["instances"]
node["opsworks"]["layers"]["mongo-config"]["instances"].each { |key, instance|
	
	Chef::Log.debug "instance: #{instance['private_dns_name']}"

	config_instances.push "#{instance['private_dns_name']}:27019"
}

config_instances_str = config_instances.join(',')
Chef::Log.debug "config_instances_str: #{config_instances_str}"

node.set['mongodb']['config']['configdb'] = config_instances_str

include_recipe 'mongodb::mongos'