> Readers please note that this document describes desired behavior, a
> specification-lite, if you will

# Configuring Slurm with this Module

## Wrap this Cookbook

This cookbook can configure a basic working cluster (see Defaults), but is
intended to be wrapped by a cookbook that contains the templates, attributes,
and data particular to your cluster.  For more information on wrapper
cookbooks, refer to the [Chef Blog](https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/)

## Config Files

Slurm configuration is driven by plain text files using a "attribute=value"
structure.  There is a configuration file for the core daemons (slurmd and
slurmctld which use `slurm.conf`) and one for the Slurm account database
connector daemon (slurmdbd, which uses `slurmdbd.conf`). 

Some basic templates are provided in this cookbook for testing of the cookbook. However, this cookbook is designed to use templates from a wrapper cookbook.  The attribute `node.default['slurm-wlm']['templates']['cookbook']` should contain the name of the cookbook where this cookbook will find the templates to use.

For example, if you create your own template (`my_slurm.conf.erb`)in
a wrapper cookbook named `wrap_slurm`:

- `node.default['slurm-wlm']['templates']['cookbook'] = 'wrap_slurm'`

Template names are similarly indicated:

- `node.default['slurm-wlm']['templates']['slurm_conf'] = 'my_slurm.conf.erb'`
- `node.default['slurm-wlm']['templates']['slurmdbd_conf'] = 'my_slurmdbd.conf.erb'`

Your own templates can use attribute-values or could be a simple text file with no ERB.  Note that minimally the attribute `node.default['slurm-wlm']['configs']['ClusterName']` is required even if unused in the template(s)

## `slurm.conf` Configuration Parameters

Slurm configs come in attribute/value pairs separated by an equals sign, e.g.:

    ClusterName=planetexpress

There are numerous configuration parameters available and these will change over time.  The definition of the templates will expose any subkeys of the attribute `node['slurm-wlm']['configs']['slurm']` into the template in a hash named "config".  Thus:

`node['slurm-wlm']['configs']['slurm']['ClusterName'] = 'planetexpress'`

would make a varaible `config['ClusterName']` with value `planetexpress` available to the `slurm.conf` template that can then be referenced in your template:

`ClusterName = <%= @config['ClusterName'] %>`
    
> These configuration parameters are not checked to ensure that they will work within Slurm- incorrect inputs will not raise an error until one of the daemons is started.

## `slurmdbd.conf` Configuration

`slurmdbd.conf` is created in a similar manner.  A stock template is defined in this cookbook, but intended to be overidden by your own template in a wrapper module.  Any attribute defined in `default['slurm-wlm']['configs']['slurmdbd']` is made available to the templating engine.

## Other Configuration Files

> TBD: I expect that this cookbook will follow a similar approach for writing these files

## Prolog/Epilog Scripts

Slurm allows you to run scripts at various times during the lifespan of a job
or run scripts to perform various basic maintenance tasks (e.g. the DBD
`ArchiveScript`).  These are basic shell scripts.

This cookbook does not define any scripts.  It is necessary for your wrapper
cookbook to provide the script (via template or plain file) and specify the
location in the Slurm configuration attributes.

For example, to configure a prolog script, you can use the attribute:

    node['slurm-wlm']['slurm']['configs'] => {
        ...
        'Prolog' = '/usr/share/slurm-wlm/scripts/slurmd.prolog',
        ...
    }

Referencing this in your `slurm.conf` template:

    Prolog=<%= @Prolog %>

And then add the following snippet and your script template to your wrapper:

    template 'prolog' do
        source 'prolog.erb'
        path node['slurm-wlm']['slurm']['configs']['Prolog']
        ...
        ...
    end

# Package Management

Packages are installed based on the recipes run:

 - client: installs Slurm clients (srun, squeue, sbatch, et alia)
 - slurmd: installs Slurm daemon
 - slurmctld: installs the Slurm cluster controller
 - slurmdbd: installs the database daemon
 - pam: installs libpam-slurm
 - munge: installs munge for authentication

If you want this cookbook to manage packages, set `default['slurm-wlm']['packages']['manage']` to `true`.  A value of false will still configure the system, but will assume the necessary packages have already been installed.

The remainder of the elements of the `default['slurm-wlm']['packages']` map the
recipe being run (slurmd, client, etc.) to a package that should be installed.
The default maps the recipes to packages from the Debian `slurm-wlm` package:
if different packages are required, change the value for each of the recipe
keys.  Note that _every_ value is required. Recipes may share package names.

For example, if you have a package "slurm-everything" which has all of the
slurm components installed:

    node.override['slurm-wlm']['packages'] = {
      'client' => 'slurm-everything',
      'slurmctld' => 'slurm-everything',
      ...
      'munge' => 'slurm-everything'
    }

Note that dependencies should be handled by the package.  If multiple packages
are required for a recipe but not handled by the package's dependencies, an
array of package names may be used, e.g:

    default['slurm-wlm']['packages']['slurmd'] => ['slurmd', 'libslurm']

# Account Database Configuration

If you want to have this cookbook set up and configure the Slurm database, set
the following attribute:

    node['slurm-wlm']['database']['manage'] = true

> TODO: how to configure database secrets

At this time, only the MySQL back-end is supported.  When configured, this
module will set up the MySQL database indicated on the command-line according
to the instructions given in the [Slurm
documentation](http://slurm.schedmd.com/accounting.html).

