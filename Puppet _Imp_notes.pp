# Points to remember:

Puppet is configurational management tool used to define the state of a system.

#Tip : When we create users using puppet in production, its better to use same UID and GID across network as this will help in preventing
# any kind of permission issues on the shared device or when moving files between machines.

# A class declares a set of resources related to single system component.

# Check below example
=========================================
class cowsayings::fortune {
  package { 'fortune-mod':
    ensure => 'present',
  }
}

refering to above example please note class fortune is prepended with cowsayings::
when we declare a class this scope syntax tells puppet where to find that class.



# Use below command to find out order of directory search puppet uses to find modules

 puppet master --configprint modulepath

usual o/p is /etc/puppetlabs/code/environments/production/modules
   then        /etc/puppetlabs/puppet/modules
  & at last    /opt/puppet/share/puppet/modules 


# Command to check installed modules in puppet:

    puppet module list

# All Puppet file server URIs are structured as follows:    
  puppet://{server hostname (optional)}/{mount point}/{remainder of path}

# service pe-httpd status 
# Tells you the pid for the httpd running for PE.

#   hiera.yaml file : for defining external parameter sources

puppet config print environmentpath environment


# use below command to find out current hiera file:
puppet config print hiera_config


