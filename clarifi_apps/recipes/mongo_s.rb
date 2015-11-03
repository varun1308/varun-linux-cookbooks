#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

config_instances = node["opsworks"]["layers"]["mongo-config"]["instances"].join(',')

node["mongodb"]["sharding"]["configDB"] = config_instances

include_recipe 'mongodb::mongos'