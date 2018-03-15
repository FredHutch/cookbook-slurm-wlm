
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmctld'] do
    version node['slurm-wlm']['packages']['version']
  end
end

service node['slurm-wlm']['services']['slurmctld'] do
  action [:enable]
end
