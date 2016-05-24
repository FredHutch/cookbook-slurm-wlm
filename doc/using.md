> Readers please note that this document describes desired behavior, a
> specification-lite, if you will

# Configuring Slurm with this Module

## Wrap this Cookbook

This cookbook can configure a basic working cluster (see Defaults), but is
intended to be wrapped by a cookbook that contains the templates, attributes,
and data particular to your cluster.  For more information on wrapper
cookbooks, refer to the [Chef Blog](https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/)

## Config File Templates

Slurm configuration is driven by plain text files using a "attribute=value"
structure.  There is a configuration file for the core daemons (slurmd and
slurmctld which use `slurm.conf`) and one for the Slurm database connector
daemon (slurmdbd, which uses `slurmdbd.conf`). 

The value should point to a template in your wrapper cookbook's `templates`
directory. For example, if you create your own template (`my_slurm.conf.erb`)in
a wrapper cookbook named `my_slurm_config` add these two attributes to your
wrapper:

  - `node.default['slurm-wlm']['templates']['wrapper'] = 'my_slurm_config'`
  - `node.default['slurm-wlm']['templates']['slurm_conf'] = 'my_slurm.conf.erb'`
  - `node.default['slurm-wlm']['templates']['slurmdbd_conf'] = 'my_slurmdbd.conf.erb'`

The templates provided in this cookbook will expose any and all key-value pairs
in the attribute `node['slurm-wlm']['configs']` and use databags for node and
partition definitions (see Defining Nodes and Partitions).  The default will
not configure a DBD host or database.

Your own templates can use attribute-values or could be a simple text file with
no ERB.  Note that minimally the attribute
`node.default['slurm-wlm']['configs']['ClusterName']` is required even if
unused in the template(s)

## Slurm Configuration Parameters

Slurm configs come in attribute/value pairs separated by an equals sign, e.g.:

    ClusterName=planetexpress

There are numerous configuration parameters available- if you wish to use attributes to create the Slurm configuration, create the following:

    node['slurm-wlm']['configs'] => {
        'ClusterName' = 'planetexpress',
        'ControlMachine' = 'bender',
        'FirstJobID' = 42,
        ...
    }

For each of these the key must be a valid Slurm attribute.  These can then be referenced in your template:

    ClusterName = <%= @node['slurm-wlm']['configs']['ClusterName'] %>
    
or possibly more efficiently:

    <% @node['slurm-wlm']['configs'].each do |attr,value| -%> 
    <%= attr %> = <%= value %>
    <% end -%>

Note that no validation or consistency is checked- incorrect inputs will not raise an error until one of the daemons is started.

## Defining Nodes and Partitions

The slurm configuration file also defines partitions and nodes.  These can be
defined in your template statically:

    NodeName=node01 CPUs=2 ...
    PartitionName=partition1 shared=FORCE ...

Or defined via databags using this in your template:

> TBD- do we define just the lines, or parameters that we expand?

## `slurmdbd.conf` Configuration

`slurmdbd.conf` is created in a similar manner.  A stock template is defined in this cookbook, but intended to be overidden by your own template in a wrapper module.  Any attribute defined in `default['slurm-wlm']['slurmdbd']['config']` is made available to the templating engine.

## Ancillary Scripts

Slurm allows you to run scripts at various times during the lifespan of a job
or run scripts to perform various basic maintenance tasks (e.g. the DBD
`ArchiveScript`).  These are basic shell scripts.

This cookbook does not define any scripts.  It is necessary for your wrapper
cookbook to provide the script (via template or plain file) and specify the
location in the Slurm configuration.

For example, to configure a prolog script, you can use the attribute:

    node['slurm-wlm']['configs'] => {
        ...
        'Prolog' = '/usr/share/slurm-wlm/scripts/slurmd.prolog',
        ...
    }

And then add the following template to your wrapper:

    template 'prolog' do
        source 'prolog.erb'
        path node['slurm-wlm']['configs']['Prolog']
        ...
        ...
    end


