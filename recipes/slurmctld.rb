package 'slurmctld' do
  action :install
end

service 'slurmctld' do
  action [ :enable, :start ]
end
