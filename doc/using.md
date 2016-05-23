# Configuring Slurm with this Module

Slurm configuration is driven by configuration files- slurm.conf,
slurmdbd.conf, etc.  This module provides templates for all of these but it
will likely be necessary for you to override these templates using your own.

Each of these config files can have a custom template- define this in the
attributes:

  - `slurm_conf_template`
  - `slurmdbd_conf_template`

The default will use the provided templates in the cookbook which have a
minimum number of attributes (e.g. `ClusterName`) using databags for node and
partition definitions.

## `slurm.conf` Configuration

The slurm configuration file defines partitions and nodes.  These can be
defined in your template statically:

    NodeName=node01 CPUs=2 ...
    PartitionName=partition1 shared=FORCE ...

Or defined via databags using this in your template:

    <%= partition_data %>
    <%= node_data %>

Any attribute defined in `default['slurm-wlm']['config']` namespace is exported
to the templating mechanism enabling you to define any valid Slurm
configuration attribute in the cookbook attributes and have that available to
your template.

## `slurmdbd.conf` Configuration

`slurmdbd.conf` is created in a similar manner.  A stock template is defined in this cookbook, but intended to be overidden by your own template in a wrapper module.  Any attribute defined in `default['slurm-wlm']['slurmdbd']['config']` is made available to the templating engine.

## Ancillary Scripts

Slurm allows you to run scripts at various times during the lifespan of a job or run scripts to perform various basic maintenance tasks (e.g. the DBD `ArchiveScript`).  These are basic shell scripts.

This cookbook does not define any scripts.  It is necessary for your wrapper cookbook to define both the script (via template or plain file) and the location on the target via the Slurm configuration parameter.

For example, to configure a 


