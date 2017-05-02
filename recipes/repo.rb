
# Cookbook:: slurm-wlm
# Recipe:: repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

unless node['slurm-wlm']['repository']['uri'].nil?
  apt_repository 'slurm-wlm' do
    uri node['slurm-wlm']['repository']['uri']
    components ['main']
    arch 'amd64'
    distribution 'trusty'
  end

end
apt_update 'update apt'
