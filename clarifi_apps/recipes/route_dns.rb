#
# Cookbook Name:: clarifi_apps
# Recipe:: route_dns
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'net/http'
include_recipe 'route53'

route53_record "create a record" do
  name  node["opsworks"]["instance"]["layers"][0] + '.' + node[:route53]["domain"]
  value node["opsworks"]["instance"]["private_ip"] #Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/public-ipv4'))
  type  "A"
  ttl   60
  zone_id               node[:route53][:dns_zone_id]
  #aws_access_key_id     node[:custom_access_key]
  #aws_secret_access_key node[:custom_secret_key]
  overwrite true
  action :create
end