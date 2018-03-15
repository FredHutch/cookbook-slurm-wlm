# Package names that each recipe should install. These defaults are for
# Debian/Ubuntu.  If you create a single package, you still need to set the
# package name for each recipe.  e.g. if you have package "slurm-everything":

# 'client' => 'slurm-everything',
# 'slurmctld' => 'slurm-everything',
# ...
#
# Set 'manage' to false if this cookbook won't manage installation
default['slurm-wlm']['packages']['manage'] = true

# Set this to an appropriate string to pin slurm packages
# to a version
default['slurm-wlm']['packages']['version'] = nil

case node['lsb']['codename']
when 'trusty'
  default['slurm-wlm']['services'] = {
    'slurmd' => 'slurm-llnl',
    'slurmctld' => 'slurm-llnl',
    'slurmdbd' => 'slurmdbd'
  }
  default['slurm-wlm']['packages'] = {
    'client' => 'slurm-llnl',
    'slurmd' => 'slurm-llnl',
    'slurmctld' => 'slurm-llnl',
    'slurmdbd' => 'slurm-llnl-slurmdbd',
    'pam' => 'libpam-slurm',
    'munge' => 'munge'
  }
when 'xenial'
  default['slurm-wlm']['services'] = {
    'slurmd' => 'slurmd',
    'slurmctld' => 'slurmctld',
    'slurmdbd' => 'slurmdbd'
  }
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
  'slurmdbd_conf' => 'slurmdbd.conf.erb',
  'munge_key' => 'munge.key'
}

default['slurm-wlm']['files'] = {
  'configdir' => '/etc/slurm-llnl',
  'daemon_user' => 'slurm',
  'rundir' => '/var/run/slurm-llnl',
  'spooldir' => '/var/spool/slurm-llnl',
  'service' => 'slurm',
  'config' => "#{default['slurm-wlm']['files']['configdir']}/slurm.conf",
  'defaults' => '/etc/default/slurm-llnl',
  'defaults_dir' => '/etc/default',
  'group' => 'slurm',
  'logdir' => '/var/log/slurm-llnl',
  'plugstack_conf' => '',
  'spank_plugins' => ''
}

default['slurm-wlm']['config']['slurm'] = {}
default['slurm-wlm']['config']['slurmdbd'] = {}
