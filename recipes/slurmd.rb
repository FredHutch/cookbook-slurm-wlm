unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmd'] do
    version node['slurm-wlm']['packages']['version']
  end
end

service node['slurm-wlm']['services']['slurmd'] do
  action [:enable, :start]
end
