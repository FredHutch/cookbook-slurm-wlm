#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'slurm-wlm::munge'
include_recipe 'slurm-wlm::config'
#include_recipe 'slurm-wlm::client'
#include_recipe 'slurm-wlm::munge'
# include_recipe 'slurm-wlm::pam'
# include_recipe 'slurm-wlm::slurmctld'
include_recipe 'slurm-wlm::conf'
# include_recipe 'slurm-wlm::slurmd'
# include_recipe 'slurm-wlm::slurmdbd'
