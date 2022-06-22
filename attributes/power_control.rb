default['slurm-wlm']['config']['slurm'] = {
  'SuspendProgram' => '/var/lib/slurm-llnl/suspend',
  'SuspendTime' => '300',
  'SuspendRate' => '10',
  'ResumeProgram' => '/var/lib/slurm-llnl/resume',
  'ResumeRate' => '10',
  'ResumeTimeout' => '300',
  'PrivateData' => 'cloud',
}
default['slurm-wlm']['templates'] = {
  'SuspendProgram' => 'suspend.erb',
  'ResumeProgram' => 'resume.erb',
}
