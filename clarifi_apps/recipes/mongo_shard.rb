#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_shard
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if !node[:mongodb][:cluster_name].empty?
	node.set[:mongodb][:shard_name] = node["opsworks"]["instance"]["hostname"]
end

include_recipe "mongodb::default"