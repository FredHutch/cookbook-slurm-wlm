raise 'Cluster Name is required and not set.' if \
  node['slurm-wlm']['config']['ClusterName'] == ''
raise 'Control Machine is required and not set' if \
  node['slurm-wlm']['config']['ControlMachine'] == ''

user 'slurm' do
  comment node['slurm-wlm']['user']['gecos']
  home node['slurm-wlm']['user']['home']
  shell node['slurm-wlm']['user']['shell']
  uid node['slurm-wlm']['user']['uid']
  #gid node['slurm-wlm']['user']['gid']
  password '!'
  action :create
  # Add this user only when 'manage_user' is true
  only_if { node['slurm-wlm']['user']['manage_user'] }
  # And then, don't add if it exists in passwd
  not_if 'getent passwd slurm'
end

# rundir/service
directory node['slurm-wlm']['files']['rundir'] do
  owner node['slurm-wlm']['files']['daemon_user']
  group node['slurm-wlm']['files']['group']
  mode '0755'
  action :create
  recursive true
end

# spooldir/service
directory node['slurm-wlm']['files']['spooldir'] do
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

# Logging directory
directory node['slurm-wlm']['files']['logdir'] do
  owner node['slurm-wlm']['files']['daemon_user']
  group node['slurm-wlm']['files']['group']
  mode '0755'
  recursive true
  action :create
end

template "#{node['slurm-wlm']['files']['configdir']}/slurm.conf" do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['slurm_conf']
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    'config' => node['slurm-wlm']['config']['slurm']
  )
  action :create
end

# init/systemd defaults file
template "/etc/default/#{node['slurm-wlm']['files']['service']}" do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    'config' => "#{node['slurm-wlm']['files']['configdir']}/slurm.conf"
  )
  action :create
end
