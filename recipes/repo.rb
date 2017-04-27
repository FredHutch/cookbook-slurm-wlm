#
# Cookbook:: slurm-wlm
# Recipe:: repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'slurm-wlm' do
  uri 'http://5d6abb19.ngrok.io/aptly/public'
  components 'main'
  arch 'amd64'
  distribution 'trusty'
end

apt_update
