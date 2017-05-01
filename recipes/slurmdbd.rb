if node['slurm-wlm']['config']['ArchiveEvents'] == 'yes'
  directory node['slurm-wlm']['config']['ArchiveDir'] do
    owner 'slurm'
    group 'slurm'
    mode '0644'
    action :create
  end
end

package 'slurmdbd' do
  options "-y --force-yes" # forces YES for all prompts
  action :install
end

# slurmdbd.conf 
# create the template and pass the data into the template
template "#{node['slurm-wlm']['files']['configdir']}/slurmdb.conf" do
  cookbook node['slurm-wlm']['templates']['cookbook']
  source node['slurm-wlm']['templates']['slurmdbd_conf']
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    node['slurm-wlm']['config']['slurmdbd']
  )
  action :create
end

service 'slurmdbd' do
  action [ :enable, :start ]
end

# execute 'cluster_add' do
#   command "sacctmgr --immediate add cluster #{node['slurm-wlm']['config']['ClusterName']}"
#   environment 'PATH' => "/bin:/usr/bin:/usr/sbin"
#   not_if "sacctmgr --noheader list cluster #{node['slurm-wlm']['config']['ClusterName']} format=Cluster |/bin/grep #{node['slurm-wlm']['config']['ClusterName']}"
#   action :run
# end

