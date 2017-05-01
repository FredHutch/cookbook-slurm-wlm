#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: conf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#grab the data from data_bags
nodes = data_bag_item(
    "slurm-#{node['slurm-wlm']['config']['ClusterName']}",
    'nodes'
)
partitions = data_bag_item(
    "slurm-#{node['slurm-wlm']['config']['ClusterName']}",
    'partitions'
)

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

# plugstack.conf
template "#{node['slurm-wlm']['files']['configdir']}/plugstack.conf" do
  source 'plugstack.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(spank_plugins: nodes)
  action :create
end

# default
template "#{node['slurm-wlm']['files']['defaults_dir']}/#{node['slurm-wlm']['files']['service']}" do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(spank_plugins: nodes)
  action :create
end

# TaskEpilog
if node['slurm-wlm']['config']['TaskEpilog'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['TaskEpilog']}" do
    source "#{node['slurm-wlm']['config']['TaskEpilog']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end

# TaskProlog
if node['slurm-wlm']['config']['TaskProlog'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['TaskProlog']}" do
    source "#{node['slurm-wlm']['config']['TaskProlog']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end

# Epilog
if node['slurm-wlm']['config']['Epilog'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['Epilog']}" do
    source "#{node['slurm-wlm']['config']['Epilog']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end

# Prolog
if node['slurm-wlm']['config']['Prolog'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['Prolog']}" do
    source "#{node['slurm-wlm']['config']['Prolog']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end

# EpilogSlurmctld
if node['slurm-wlm']['config']['EpilogSlurmctld'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['EpilogSlurmctld']}" do
    source "#{node['slurm-wlm']['config']['EpilogSlurmctld']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end

# PrologSlurmctld
if node['slurm-wlm']['config']['PrologSlurmctld'] != ''
    template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['config']['PrologSlurmctld']}" do
    source "#{node['slurm-wlm']['config']['PrologSlurmctld']}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: node['slurm-wlm']['config'])
    action :create
    end
end
