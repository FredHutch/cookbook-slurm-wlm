package 'slurmctld' do
  options '-y --force-yes' # forces YES for all prompts
  action :install
end

service 'slurmctld' do
  action [:enable, :start]
end
