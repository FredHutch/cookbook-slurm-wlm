
# Cookbook:: slurm-wlm
# Recipe:: repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

unless node['slurm-wlm']['repository']['uri'].nil?

  if node['slurm-wlm']['repository']['distribution'].nil?
    distribution = node['lsb']['codename']
  else
    distribution = node['slurm-wlm']['repository']['distribution']
  end

  apt_repository 'slurm-wlm' do
    uri node['slurm-wlm']['repository']['uri']
    components node['slurm-wlm']['repository']['components']
    arch node['slurm-wlm']['repository']['arch']
    distribution distribution
    key node['slurm-wlm']['repository']['key']
    keyserver node['slurm-wlm']['repository']['keyserver']
  end
end
apt_update 'update apt'
