#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

instances = node["opsworks"]["layers"]["mongo-config"]["instances"]

config_instances = instances.join(',')

node["mongodb"]["sharding"]["configDB"] = config_instances

include_recipe 'mongodb::mongos'