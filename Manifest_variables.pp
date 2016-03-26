# Variables can also be used to get rid of repitition also.
# Like grouping together for the same resource type.
# for e.g defining of multiple packages in an array.



node 'learning.puppetlabs.vm' {

	class { 'linux' : }

}



class linux {
	# resources

    $admintools = [ 'git', 'nano', 'screen' ]

		package { 'admintools':
		ensure => installed,
				}	

	$ntpservice = $osfamily ?{
    'redhat' => 'ntpd',	
    'debian' => 'ntp',
    default  => 'ntp',
}

package { '$ntp':
      ensure => installed,
             }
    service { $ntpservice:
        enable           => true,
        ensure         => running,
         #hasrestart  => true,
         #hasstatus => true,
         #require => Class["config"],
         }

file { '/node.txt':
          ensure      => 'present',
          content => inline_template ("Created by puppet at <%= Time.now %>\n"),
                }         
}


