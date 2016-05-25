#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# uncomment when on FH network
# =============================
# package 'libslurm' do
#   action :install
# end

# package 'slurm-llnl' do
#   action :install
# end

# package 'slurm-llnl-basic-plugins' do
#   action :install
# end

# include_recipe 'slurm-wlm::munge'
# include_recipe 'slurm-wlm::pam'
# include_recipe 'slurm-wlm::slurmctld'

include_recipe 'slurm-wlm::conf'
