#
# Cookbook:: cookbook-slurm-wlm
# Recipe:: power_control
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Power control configuration is handled in attributes in the Slurm config
# file.  This installs the suspend/resume scripts based on those attributes

# Install resume/suspend scripts

template node['slurm-wlm']['config']['slurm']['SuspendProgram'] do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['SuspendProgram']
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    'config' => node['slurm-wlm']['config']['slurm']
  )
  action :create
end

template node['slurm-wlm']['config']['slurm']['ResumeProgram'] do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['ResumeProgram']
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    'config' => node['slurm-wlm']['config']['slurm']
  )
  action :create
end
