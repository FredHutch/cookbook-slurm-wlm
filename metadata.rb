name 'slurm-wlm'
maintainer 'Scientific Computing - Fred Hutchinson Cancer Research Ctr.'
maintainer_email 'scicomp@fredhutch.org'
license 'Apache 2.0'
description 'Installs and configures SchedMD Slurm Workload Manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

attribute 'slurm-wlm/package_name',
    display_name: 'Package name for installation',
    description: 'The name of the package that should be installed - defaults to "slurm-wlm"',
    required: 'required',
    default: 'slurm-wlm'


attribute 'slurm-wlm/controller',
    display_name: 'Hostname of the Slurm Controller',
    description: 'The name of the host running the Slurm control daemon (slurmctld)',
    required: 'required',
    default: 'localhost'

attribute 'slurm-wlm/dbd/database_host',
    display_name: 'Host for Slurm Database Daemon




