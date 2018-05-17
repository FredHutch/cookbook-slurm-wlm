include_recipe 'slurm-wlm::munge'
unless node['slurm-wlm']['packages']['manage'] == false
  # This requires a string for the name as using edit or
  # delete _resource functions don't seem to work when
  # the package name is an array
  package 'slurm-client-packages' do
    package_name [
      node['slurm-wlm']['packages']['client'],
      node['slurm-wlm']['packages']['plugins']
    ]
    version [
      node['slurm-wlm']['packages']['version'],
      node['slurm-wlm']['packages']['version']
    ]
  end
end
