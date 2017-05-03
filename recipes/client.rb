include_recipe 'slurm-wlm::munge'
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['client']
end
