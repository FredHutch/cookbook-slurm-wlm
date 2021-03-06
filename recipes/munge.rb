
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['munge']
end

directory '/etc/munge' do
  owner 'munge'
  group 'root'
  mode '0700'
  action :create
end

cookbook_file '/etc/default/munge' do
  source 'munge'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

directory '/var/log/munge' do
  owner 'munge'
  group 'root'
  mode '0700'
  recursive true
  action :create
end

directory '/var/lib/munge' do
  owner 'munge'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/var/run/munge' do
  owner 'munge'
  group 'root'
  mode '0711'
  recursive true
  action :create
end

cookbook_file '/etc/munge/munge.key' do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['munge_key']
  owner 'munge'
  group 'root'
  mode '0400'
  action :create
  notifies :start, 'service[munge]', :immediate
end

service 'munge' do
  action [:nothing]
end
