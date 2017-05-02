
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmctld']
end

service node['slurm-wlm']['services']['slurmd'] do
  action [:enable, :start]
end
