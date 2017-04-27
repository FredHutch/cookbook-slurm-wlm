name 'slurm-wlm'
maintainer 'Scientific Computing - Fred Hutchinson Cancer Research Ctr.'
maintainer_email 'scicomp@fredhutch.org'
license 'Apache 2.0'
description 'Installs and configures SchedMD Slurm Workload Manager'
version '0.1.0'

depends 'line', '~> 0.6.3' # resources to manipulate files 

attribute 'slurm-wlm/package_name',
    display_name: 'Package name for installation',
    description:
        'The name of the package that should be installed - ' \
        'defaults to "slurm-wlm"',
    required: 'required',
    default: 'slurm-wlm'

attribute 'slurm-wlm/package_source',
    display_name: 'Repository containing Slurm packages',
    description:
        'URL of the repository containing Slurm- leave blank ' \
        'to use the already configured or system sources',
    required: 'optional',
    default: ''

attribute 'slurm-wlm/templates/wrapper',
    display_name: 'Wrapper cookbook containing templates',
    description:
        'The name of a cookbook wrapping this one which ' \
        'contains templates necessary for configuring ' \
        'Slurm components.  If this is not included then ' \
        'the templates in this cookbook are used ',
    required: 'optional',
    default: 'slurm-wlm'

attribute 'slurm-wlm/templates/slurm_conf',
    display_name: 'Template name for Slurm core daemons',
    description:
        'The name of the template for the Slurm\'s config ' \
        'file `slurm.conf` ',
    required: 'optional',
    default: 'slurm.conf.erb'

attribute 'slurm-wlm/templates/slurmdbd_conf',
    display_name: 'Template name for Slurm database daemon config file',
    description:
        'The name of the template for the Slurm\'s `slurmdbd` ' \
        'configuration file `slurmdbd.conf` ',
    required: 'optional',
    default: 'slurmdbd.conf.erb'

attribute 'slurm-wlm/configs/ClusterName',
    display_name: 'The name of the cluster being configured',
    description:
        'This attribute indicates the name of the cluster ' \
        'being configured. This value will be put in for ' \
        'the `ClusterName` parameter in `slurm.conf`',
    required: 'required',
    default: 'cluster'

