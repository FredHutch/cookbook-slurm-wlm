package 'slurmd' do
  options "-y --force-yes" # forces YES for all prompts
  action :install
end

service 'slurmd' do
  action [ :enable, :start ]
end

