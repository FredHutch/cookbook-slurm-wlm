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

attribute 'slurm-wlm/cluster_name',
    display_name: 'Name of the cluster',
    description:
        'The cluster name to use in the Slurm configuration. Sets ' \
        'the "ClusterName" parameter in slurm.conf',
    required: 'required',
    default: 'cluster'

attribute 'slurm-wlm/controller',
    display_name: 'Hostname of the Slurm Controller',
    description:
        'The name of the host running the Slurm control daemon (slurmctld)',
    required: 'required',
    default: 'localhost'

attribute 'slurm-wlm/accounting/AccountingStorageEnforce',
    display_name: 'Level of association-based enforcement',
    description:
        'Which, if any, association based limits and levels to enforce.  ' \
        'Valid values are "false", "associations", "limits", "nojobs", ' \
        '"nosteps", "qos", "safe", "wckeys", or "all".  False disables '\
        'enforcement',
    choice: [
        'false', 'associations', 'limits', 'nojobs',
        'nosteps', 'qos', 'safe', 'wckeys', 'all'
        ],
    default: 'false'

attribute 'slurm-wlm/accounting/AccountingStorageType',
    display_name: 'Accounting Storage Plugin Type',
    description:
        'Plugin type for the storage of accounting data.  Valid '\
        'values are "none", "slurmdbd", "mysql", "filetxt".  Default '\
        'is "none"',
    required: 'required',
    default: 'none',
    choice: [ 'none', 'slurmdbd', 'mysql', 'filetxt' ]

attribute 'slurm-wlm/accounting/AccountingStorageHost',
    display_name: 'Slurm Database Daemon host',
    description:
        'Configures Slurm to use the SlurmDBD host indicated. Defaults '\
        "to node['slurm-wlm']['controller']",
    default: 'localhost'



