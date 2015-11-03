#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

Chef::Log.level = :debug

config_instances = []
Chef::Log.debug "Found instances found for mongo-config layer : #{node['opsworks']['layers']['mongo-config']['instances']}"

node["opsworks"]["layers"]["mongo-config"]["instances"]
node["opsworks"]["layers"]["mongo-config"]["instances"].each { |instance|
	
	Chef::Log.debug "instance#{}: #{instance.private_dns_name}"

	config_instances.push "#{instance.private_dns_name}:27019"
}

Chef::Log.debug "config_instances: #{config_instances}"


node["mongodb"]["sharding"]["configDB"] = config_instances.join(',')

include_recipe 'mongodb::mongos'