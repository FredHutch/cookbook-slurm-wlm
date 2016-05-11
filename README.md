# slurm-wlm Cookbook

## Description

This cookbook manages the Slurm Workload Manager packages and configuration

## Platform

This cookbook is tested on the following platforms:

 - Ubuntu "Trusty" 14.04 LTS
 - CentOS 7.1

## Cookbooks

This cookbook depends on:

## Attributes

- `default['slurm-wlm']['package_name']` - the name of the package to install
- `default['slurm-wlm']['controller']` - hostname of the Slurm controller
- `default['slurm-wlm']['dbd']['database_host']` - hostname of the database server
- `default['slurm-wlm']['']` - 
