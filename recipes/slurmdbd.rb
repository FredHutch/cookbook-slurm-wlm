if node['slurm-wlm']['config']['ArchiveEvents'] == 'yes'
  directory node['slurm-wlm']['config']['ArchiveDir'] do
    owner 'slurm'
    group 'slurm'
    mode '0644'
    action :create
  end
end

template "#{node['slurm-wlm']['files']['configdir']}/#{node['slurm-wlm']['files']['dbdconfig']}" do
  source "#{node['slurm-wlm']['files']['dbdconfig']}.erb"
  owner 'root'
  group '3'
  mode '0755'
      variables(config: node['slurm-wlm']['config'],
                files: node['slurm-wlm']['files'])
  action :create
end

package 'slurmdbd' do
  action :install
end
service 'slurmdbd' do
  action [ :enable, :start ]
end

execute 'cluster_add' do
  command "sacctmgr --immediate add cluster #{node['slurm-wlm']['config']['ClusterName']}"
  environment 'PATH' => "/bin:/usr/bin:/usr/sbin"
  not_if "sacctmgr --noheader list cluster #{node['slurm-wlm']['config']['ClusterName']} format=Cluster |/bin/grep #{node['slurm-wlm']['config']['ClusterName']}"
  action :run
end

