# Package names that each recipe should install. These defaults are for
# Debian/Ubuntu.  If you create a single package, you still need to set the
# package name for each recipe.  e.g. if you have package "slurm-everything":

# 'client' => 'slurm-everything',
# 'slurmctld' => 'slurm-everything',
# ...
#
# Set 'manage' to false if this cookbook won't manage installation
default['slurm-wlm']['packages']['manage'] = true
case node['lsb']['codename']
when 'trusty'
  default['slurm-wlm']['packages'] = {
    'client' => 'slurm-llnl',
    'slurmd' => 'slurm-llnl',
    'slurmctld' => 'slurm-llnl',
    'slurmdbd' => 'slurm-llnl-slurmdbd',
    'pam' => 'libpam-slurm',
    'munge' => 'munge'
  }
when 'xenial'
  default['slurm-wlm']['packages'] = {
    'client' => 'slurm-client',
    'slurmd' => 'slurmd',
    'slurmctld' => 'slurmctld',
    'slurmdbd' => 'slurmdbd',
    'pam' => 'libpam-slurm',
    'munge' => 'munge'
  }
else
  raise "unsupported platform #{node['lsb']['codename']}"
end

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
  'config' => "#{default['slurm-wlm']['files']['configdir']}/slurm.conf",
  'defaults' => '/etc/default/slurm-llnl',
  'defaults_dir' => '/etc/default',
  'group' => 'slurm',
  'logdir' => '/var/log',
  'plugstack_conf' => '',
  'spank_plugins' => ''
}

default['slurm-wlm']['config']['slurm'] = {
  'ClusterName' => 'chipmunks',
  'ControlMachine' => 'alvin',
  'NodeName' => 'alvin',
  'PartitionName' => 'alvin Nodes=alvin'
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
