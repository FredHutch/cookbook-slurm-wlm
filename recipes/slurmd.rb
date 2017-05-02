package 'slurmd' do
  options '-y --force-yes'
  action :install
end

service 'slurmd' do
  action [:enable, :start]
end
