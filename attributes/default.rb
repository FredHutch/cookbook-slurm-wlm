default['slurm-wlm']['files']['configdir'] = '/etc/slurm-llnl'
default['slurm-wlm']['files']['daemon_user'] = 'slurm'
default['slurm-wlm']['files']['rundir'] = '/var/run'
default['slurm-wlm']['files']['spooldir'] = '/var/spool'
default['slurm-wlm']['files']['service'] = 'slurm'
default['slurm-wlm']['files']['config'] = default['slurm-wlm']['files']['configdir'] << "/slurm.conf"
default['slurm-wlm']['files']['defaults'] = '/etc/default/slurm-llnl'
default['slurm-wlm']['files']['defaults_dir'] = '/etc/default'
default['slurm-wlm']['files']['group'] = 'slurm'
default['slurm-wlm']['files']['logdir'] = '/var/log'
default['slurm-wlm']['files']['job_checkpoint_dir'] = default['slurm-wlm']['files']['spooldir'] << "/checkpoint"
default['slurm-wlm']['files']['plugstack_conf'] = ''
default['slurm-wlm']['files']['spank_plugins'] = ''

default['slurm-wlm']['config']['ClusterName'] = 'gizmo'
default['slurm-wlm']['config']['ControlMachine'] = 'test-control'
default['slurm-wlm']['config']['TaskProlog'] = 'task.prolog.sh'
default['slurm-wlm']['config']['TaskEpilog'] = '' # task.epilog.sh
default['slurm-wlm']['config']['Prolog'] = 'slurmd.prolog.sh'
default['slurm-wlm']['config']['Epilog'] = 'slurmd.epilog.sh'
default['slurm-wlm']['config']['PrologSlurmctld'] = '' # prolog.slurm.ctl.d
default['slurm-wlm']['config']['EpilogSlurmctld'] = '' # epilog.slurm.ctl.d
default['slurm-wlm']['config']['JobSubmitPlugins'] = ''
default['slurm-wlm']['config']['SchedulerType'] = 'sched/backfill'
default['slurm-wlm']['config']['SchedulerParameters'] = 'default_queue_depth=1000,bf_continue,bf_interval=360,bf_max_job_user=100,bf_resolution=600,bf_window=4320,bf_max_job_part=1000,max_job_bf=300,defer'
default['slurm-wlm']['config']['SlurmctldLogFile'] = default['slurm-wlm']['files']['logdir'] << "/slurmctld.log"
default['slurm-wlm']['config']['SlurmdLogFile'] = default['slurm-wlm']['files']['logdir'] << "/slurmd.log"
default['slurm-wlm']['config']['SlurmdSchedLogFile'] = default['slurm-wlm']['files']['logdir'] << "/slurmsched.log"
default['slurm-wlm']['config']['SchedulerType'] = "sched/builtin"
default['slurm-wlm']['config']['PriorityType'] = "priority/basic"
default['slurm-wlm']['config']['SlurmdTimeout'] = "300"
default['slurm-wlm']['config']['SlurmctldTimeout'] = "300"

default['slurm-wlm']['files']['dbdStorageHost'] = ''
default['slurm-wlm']['files']['dbdStorageLoc'] = ''
default['slurm-wlm']['files']['dbdHost'] = ''
default['slurm-wlm']['files']['dbdconfig'] = 'slurmdbd.conf'
default['slurm-wlm']['config']['ArchiveDir'] = default['slurm-wlm']['files']['spooldir'] << "/slurm-event-archive"
default['slurm-wlm']['config']['ArchiveEvents'] = 'no'
default['slurm-wlm']['config']['ArchiveJobs'] = 'no'
default['slurm-wlm']['config']['ArchiveResvs'] = 'no'
default['slurm-wlm']['config']['ArchiveScript'] = ''
default['slurm-wlm']['config']['ArchiveSteps'] = 'no'
default['slurm-wlm']['config']['ArchiveSuspend'] = 'no'
default['slurm-wlm']['config']['PurgeEventAfter'] = ''
default['slurm-wlm']['config']['PurgeJobAfter'] = ''
default['slurm-wlm']['config']['PurgeResvAfter'] = ''
default['slurm-wlm']['config']['PurgeStepAfter'] = ''
default['slurm-wlm']['config']['PurgeSuspendAfter'] = ''

