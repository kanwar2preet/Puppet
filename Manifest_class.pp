# Classes in puppet help to remove repitition
# Define resources in class and use that class in node defination

node 'learning.puppetlabs.vm' {

	class { 'linux' : }

}



class linux {
	# resources
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

