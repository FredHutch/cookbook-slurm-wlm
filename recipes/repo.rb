
# Cookbook:: slurm-wlm
# Recipe:: repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'slurm-wlm' do
  uri node['slurm-wlm']['repository']['uri']
  components ['main']
  arch 'amd64'
  distribution 'trusty'
end

apt_update 'update apt'
