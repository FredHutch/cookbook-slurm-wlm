package 'libpam-slurm' do
  options '-y --force-yes'
  action :install
end

# this uses the resource from the line cookbook from supermarket
# append_if_no_line 'append line to common-account' do
#   path '/etc/pam.d/common-account'
#   line 'account required                        pam_slurm.so'
# end
