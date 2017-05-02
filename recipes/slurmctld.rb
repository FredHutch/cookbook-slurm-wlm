
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmctld']
end

service 'slurmctld' do
  action [:enable, :start]
end
