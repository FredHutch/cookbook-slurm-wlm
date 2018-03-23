include_recipe 'slurm-wlm::munge'
unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['client'] do
    version node['slurm-wlm']['packages']['version']
  end
  package node['slurm-wlm']['packages']['plugins'] do
    version node['slurm-wlm']['packages']['version']
  end
end
