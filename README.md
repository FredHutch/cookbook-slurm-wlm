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
    <td><code>node['slurm-wlm']['cluster_name']</code></td>
    <td>The cluster name to use in the Slurm configuration. Sets the "ClusterName" parameter in slurm.conf</td>
    <td><code>cluster</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['controller']</code></td>
    <td>The name of the host running the Slurm control daemon (slurmctld)</td>
    <td><code>localhost</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['accounting']['AccountingStorageEnforce']</code></td>
    <td>Which, if any, association based limits and levels to enforce.  Valid values are "false", "associations", "limits", "nojobs", "nosteps", "qos", "safe", "wckeys", or "all".  False disables enforcement</td>
    <td><code>false</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['accounting']['AccountingStorageType']</code></td>
    <td>Plugin type for the storage of accounting data.  Valid values are "none", "slurmdbd", "mysql", "filetxt".  Default is "none"</td>
    <td><code>none</code></td>
  </tr>
  <tr>
    <td><code>node['slurm-wlm']['accounting']['AccountingStorageHost']</code></td>
    <td>Configures Slurm to use the SlurmDBD host indicated. Defaults to node['slurm-wlm']['controller']</td>
    <td><code>localhost</code></td>
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

