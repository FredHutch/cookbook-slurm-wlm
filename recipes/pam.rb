unless node['slurm-wlm']['packages']['manage'] == false
  package node['slurm-wlm']['packages']['pam'] do
    version node['slurm-wlm']['packages']['version']
  end
end

# this uses the resource from the line cookbook from supermarket
# append_if_no_line 'append line to common-account' do
#   path '/etc/pam.d/common-account'
#   line 'account required                        pam_slurm.so'
# end
