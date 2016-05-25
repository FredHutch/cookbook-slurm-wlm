package 'slurm-client' do
  action :install
end

package 'libslurm29' do
  action :install
end

package 'libslurmdb29' do
  action :install
end
