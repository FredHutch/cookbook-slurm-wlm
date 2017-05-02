unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmdbd']
end

if node['slurm-wlm']['config']['ArchiveEvents'] == 'yes'
  directory node['slurm-wlm']['config']['ArchiveDir'] do
    owner 'slurm'
    group 'slurm'
    mode '0644'
    action :create
  end
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
    'config' => node['slurm-wlm']['config']['slurm']
  )
  action :create
end

service 'slurmdbd' do
  action [:enable, :start]
end
