package 'libpam-slurm' do
  action :install
end

append_if_no_line 'append line to common-account' do
  path '/etc/pam.d/common-account'
  line 'account required                        pam_slurm.so'
end
