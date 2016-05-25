default['slurm-wlm']['files']['configdir'] = '/etc/slurm'
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

default['slurm-wlm']['config']['ClusterName'] = 'gizmo'
default['slurm-wlm']['config']['ControlMachine'] = ''
default['slurm-wlm']['config']['TaskProlog'] = ''
default['slurm-wlm']['config']['TaskEpilog'] = ''
default['slurm-wlm']['config']['Prolog'] = ''
default['slurm-wlm']['config']['Epilog'] = ''
default['slurm-wlm']['config']['PrologSlurmctld'] = ''
default['slurm-wlm']['config']['EpilogSlurmctld'] = ''
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

