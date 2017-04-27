#
# Cookbook:: slurm-wlm
# Recipe:: repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/etc/apt/sources.list.d/fhreverseproxy.list' do
  content 'deb [arch=amd64] http://5d6abb19.ngrok.io/fhcrc/ubuntu trusty main'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/apt/sources.list.d/fhreverseproxy2.list' do
  content 'deb [arch=amd64] http://5d6abb19.ngrok.io/aptly/public trusty main'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'apt-update' do
  command 'sudo apt-get update'
  action :run
end

