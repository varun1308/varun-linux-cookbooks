#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo_s
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

Chef::Log.level = :debug

include_recipe 'mongodb::mongos'