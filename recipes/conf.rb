#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: conf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# slurm.conf
# create the template and pass the data into the template
template "#{node['slurm-wlm']['files']['configdir']}/slurm.conf" do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['slurm_conf']
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    node['slurm-wlm']['config']['slurm']
  )
  action :create
end

# default
template "#{node['slurm-wlm']['files']['defaults_dir']}/"\
  "#{node['slurm-wlm']['files']['service']}" do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(spank_plugins: nodes)
  action :create
end
