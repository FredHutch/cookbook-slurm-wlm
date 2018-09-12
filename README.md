Slurm-wlm Cookbook
==================

Installs and configures SchedMD Slurm Workload Manager

Requirements
------------

### Platform:

*No platforms defined*

### Cookbooks:

*No dependencies defined*

Attributes
----------

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['package_name']</code></td>
    <td>The name of the package that should be installed - defaults to "slurm-wlm"</td>
    <td><code>slurm-wlm</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['templates']['cookbook']</code></td>
    <td>The name of a cookbook wrapping this one which contains templates necessary for configuring Slurm components.  If this is not included then the templates in this cookbook are used </td>
    <td><code>slurm-wlm</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['templates']['slurm_conf']</code></td>
    <td>The name of the template for the Slurm's config file `slurm.conf` </td>
    <td><code>slurm.conf.erb</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['templates']['slurmdbd_conf']</code></td>
    <td>The name of the template for the Slurm's `slurmdbd` configuration file `slurmdbd.conf` </td>
    <td><code>slurmdbd.conf.erb</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['configs']['ClusterName']</code></td>
    <td>This attribute indicates the name of the cluster being configured. This value will be put in for the `ClusterName` parameter in `slurm.conf`</td>
    <td><code>slurm-wlm</code></td>
  </tr>
</table>

Recipes
-------

*No recipes defined*

License and Author
------------------

Author:: Scientific Computing - Fred Hutchinson Cancer Research Ctr. (<scicomp@fredhutch.org>)

Copyright:: 2016, Scientific Computing - Fred Hutchinson Cancer Research Ctr.

License:: Apache 2.0

