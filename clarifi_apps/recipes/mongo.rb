#
# Cookbook Name:: clarifi_apps
# Recipe:: mongo
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "mongodb::10gen_repo"
include_recipe "mongodb::default"