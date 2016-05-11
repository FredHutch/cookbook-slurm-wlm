#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: conf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# grab the data from data_bags
nodes = data_bag_item('slurm-gizmo', 'nodes')
partitions = data_bag_item('slurm-gizmo', 'partitions')

# create the template and pass the data into the template
template '/home/vagrant/slurm.conf' do
  source 'slurm.conf.erb'
  owner 'root'
  mode '0755'
  variables(cluster_nodes: nodes, partitions: partitions)
  action :create
end
