# Production Repository - PoshBot Configuration Cookbook

This cookbook installs and configures:

* NSSM ([nssm.cc](https://nssm.cc/))
* PoshBot ([PoshBot Docs](https://poshbot.readthedocs.io/en/latest/))

## Knowledge Assumptions

The cookbook assumes intermediate knowledge of Chef, PowerShell and `git`.

## Requirements

* You must have [Chef Workstation](https://www.chef.sh/docs/chef-workstation/getting-started/) installed on your workstation to edit this cookbook and resolve dependencies.

## Setup

1. Launch Powershell as an administrator.
2. Clone the cookbook to your local machine.
3. `cd` to the repository.
4. Run `berks install` to install the cookbook dependencies. It will drop the cookbooks into `C:\Users\you\.berkshelf`.
5. Edit the recipe(s) as needed.

