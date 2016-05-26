package 'slurmd' do
  action :install
end

service 'slurmd' do
  action [ :enable, :start ]
end

