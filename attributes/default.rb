default['slurm-wlm']['templates'] = {
  'cookbook' => 'slurm-wlm',
  'slurm_conf' => 'slurm.conf.erb',
  'slurmdbd_conf' => 'slurmdbd.conf.erb'
}

default['slurm-wlm']['files'] = {
  'configdir' => '/etc/slurm-llnl',
  'daemon_user' => 'slurm',
  'rundir' => '/var/run',
  'spooldir' => '/var/spool',
  'service' => 'slurm',
  'config' => default['slurm-wlm']['files']['configdir'] << '/slurm.conf',
  'defaults' => '/etc/default/slurm-llnl',
  'defaults_dir' => '/etc/default',
  'group' => 'slurm',
  'logdir' => '/var/log',
  'plugstack_conf' => '',
  'spank_plugins' => ''
}

default['slurm-wlm']['config']['slurm'] = {
  'JobCheckpointDir' => \
    default['slurm-wlm']['files']['spooldir'] << '/checkpoint',
  'ClusterName' => 'gizmo',
  'ControlMachine' => 'test-control',
  'TaskProlog' => 'task.prolog.sh',
  'TaskEpilog' => '',
  'Prolog' => 'slurmd.prolog.sh',
  'Epilog' => 'slurmd.epilog.sh',
  'PrologSlurmctld' => '',
  'EpilogSlurmctld' => '',
  'JobSubmitPlugins' => '',
  'SlurmctldLogFile' => \
    default['slurm-wlm']['files']['logdir'] << '/slurmctld.log',
  'SlurmdLogFile' => \
    default['slurm-wlm']['files']['logdir'] << '/slurmd.log',
  'SlurmdSchedLogFile' => \
    default['slurm-wlm']['files']['logdir'] << '/slurmsched.log',
  'SchedulerType' => 'sched/builtin',
  'PriorityType' => 'priority/basic',
  'SlurmdTimeout' => '300',
  'SlurmctldTimeout' => '300',
  'ArchiveEvents' => 'no',
  'ArchiveJobs' => 'no',
  'ArchiveResvs' => 'no',
  'ArchiveScript' => '',
  'ArchiveSteps' => 'no',
  'ArchiveSuspend' => 'no',
  'ArchiveDir' => \
    default['slurm-wlm']['files']['spooldir'] << '/slurm-event-archive',
  'PurgeEventAfter' => '',
  'PurgeJobAfter' => '',
  'PurgeResvAfter' => '',
  'PurgeStepAfter' => '',
  'PurgeSuspendAfter' => ''
}

default['slurm-wlm']['config']['slurmdbd'] = {
  'AuthType' => 'auth/munge',
  'AuthInfo' => '/var/run/munge/munge.socket.2',
  'DbdHost' => 'gadget',
  'DebugLevel' => 'verbose',
  'StorageHost' => 'gadget',
  'StorageLoc' => 'gizmo_acct_db',
  'StorageType' => 'accounting_storage/mysql',
  'StorageUser' => 'slurm',
  'LogFile' => '/var/log/slurm-llnl/slurmdbd.log',
  'PidFile' => '/var/run/slurm-llnl/slurmdbd.pid',
  'SlurmUser' => 'slurm',
  'ArchiveDir' => '/var/spool/slurm-llnl/events',
  'ArchiveEvents' => 'yes',
  'PurgeEventAfter' => '3',
  'ArchiveJobs' => 'yes',
  'PurgeJobAfter' => '3',
  'ArchiveResvs' => 'yes',
  'PurgeResvAfter' => '3',
  'ArchiveSteps' => 'yes',
  'PurgeStepAfter' => '3',
  'ArchiveSuspend' => 'yes',
  'PurgeSuspendAfter' => '3'
}
