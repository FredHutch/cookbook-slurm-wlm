package 'slurm-client' do
  options "-y --force-yes" # forces YES for all prompts
  action :install
end

package 'libslurm29' do
  options "-y --force-yes" # forces YES for all prompts
  action :install
end

package 'libslurmdb29' do
  options "-y --force-yes" # forces YES for all prompts
  action :install
end
