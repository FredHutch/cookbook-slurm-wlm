#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
 
 # Configurent the APT repo to point to FH's reverse proxy
#
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

# include_recipe 'slurm-wlm::munge'
# include_recipe 'slurm-wlm::config'
# include_recipe 'slurm-wlm::client'
# include_recipe 'slurm-wlm::munge'
include_recipe 'slurm-wlm::pam'
# include_recipe 'slurm-wlm::slurmctld'
# include_recipe 'slurm-wlm::conf'
# include_recipe 'slurm-wlm::slurmd'
# include_recipe 'slurm-wlm::slurmdbd'
