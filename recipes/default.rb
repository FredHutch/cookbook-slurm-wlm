#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'slurm-wlm::repo'
include_recipe 'slurm-wlm::client'
include_recipe 'slurm-wlm::config'
