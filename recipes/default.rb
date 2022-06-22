#
# Cookbook:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright:: (c) 2016 The Authors, All Rights Reserved.

include_recipe 'slurm-wlm::repo'
include_recipe 'slurm-wlm::config'
include_recipe 'slurm-wlm::client'
