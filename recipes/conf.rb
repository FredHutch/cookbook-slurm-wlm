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

# create the template and pass the data into the template
template '/home/vagrant/slurm.conf' do
  source 'slurm.conf.erb'
  owner 'root'
  mode '0755'
  variables(cluster_nodes: nodes, 
            partitions: partitions,
            config: node['slurm-wlm']['config'],
            configdir: node['slurm-wlm']['files']['configdir'],
            rundir: node['slurm-wlm']['files']['rundir'],
            service: node['slurm-wlm']['files']['service'])
  action :create
end

# puts '------------'
# puts node['slurm-wlm']['files']['job_checkpoint_dir']