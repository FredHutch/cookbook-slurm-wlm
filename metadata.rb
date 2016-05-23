name 'slurm-wlm'
maintainer 'Scientific Computing - Fred Hutchinson Cancer Research Ctr.'
maintainer_email 'scicomp@fredhutch.org'
license 'Apache 2.0'
description 'Installs and configures SchedMD Slurm Workload Manager'
version '0.1.0'


attribute 'slurm-wlm/package_name',
    display_name: 'Package name for installation',
    description:
        'The name of the package that should be installed - ' \
        'defaults to "slurm-wlm"',
    required: 'required',
    default: 'slurm-wlm'

