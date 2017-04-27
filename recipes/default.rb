#
# Cookbook Name:: cookbook-slurm-wlm
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
 
 # Configurent the APT repo to point to FH's reverse proxy
#
include_recipe 'slurm-wlm::repo'
# include_recipe 'slurm-wlm::munge'
# include_recipe 'slurm-wlm::config'
# include_recipe 'slurm-wlm::client'
# include_recipe 'slurm-wlm::munge'
include_recipe 'slurm-wlm::pam'
# include_recipe 'slurm-wlm::slurmctld'
# include_recipe 'slurm-wlm::conf'
# include_recipe 'slurm-wlm::slurmd'
# include_recipe 'slurm-wlm::slurmdbd'
