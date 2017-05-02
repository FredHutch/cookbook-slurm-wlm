raise 'Cluster Name is required and not set.' if \
  node['slurm-wlm']['config']['ClusterName'] == ''
raise 'Control Machine is required and not set' if \
  node['slurm-wlm']['config']['ControlMachine'] == ''

user 'slurm' do
  comment 'slurm user'
  home '/usr/slurm'
  shell '/bin/bash'
  password 'password'
  action :create
end

# rundir/service
directory "#{node['slurm-wlm']['files']['rundir']}/"\
  "#{node['slurm-wlm']['files']['service']}" do
  owner node['slurm-wlm']['files']['daemon_user']
  group node['slurm-wlm']['files']['group']
  mode '0755'
  action :create
end

# spooldir/service
directory "#{node['slurm-wlm']['files']['spooldir']}/"\
  "#{node['slurm-wlm']['files']['service']}" do
  owner node['slurm-wlm']['files']['daemon_user']
  group node['slurm-wlm']['files']['group']
  mode '0755'
  recursive true
  action :create
end

# configdir
directory node['slurm-wlm']['files']['configdir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end
