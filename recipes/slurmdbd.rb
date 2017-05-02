if node['slurm-wlm']['config']['ArchiveEvents'] == 'yes'
  directory node['slurm-wlm']['config']['ArchiveDir'] do
    owner 'slurm'
    group 'slurm'
    mode '0644'
    action :create
  end
end

package 'slurmdbd' do
  options '-y --force-yes'
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
  action [:enable, :start]
end
