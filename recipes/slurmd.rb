unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['slurmd']
end

service 'slurmd' do
  action [:enable, :start]
end
