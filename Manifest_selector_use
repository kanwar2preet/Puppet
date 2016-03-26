# Using Selectors:
# 
# Replace 
#
#
#service { 'ntpd':
#	enable      => true,
#	ensure      => running,
#hasrestart => true,
#hasstatus  => true,
#require    => Class["config"],
#}

#  With
#
#service { $ntpservice :
#	enable      => true,
#	ensure      => running,
#hasrestart => true,
#hasstatus  => true,
#require    => Class["config"],
#}
#



$ntpservice = $osfamily ?{
  'redhat' => 'ntpd',	
  'debian' => 'ntp',
  default  => 'ntp',
}


node 'learning.puppetlabs.vm' {
    file { '/node.txt':
          ensure      => 'present',
          content => inline_template ("Created by puppet at <%= Time.now %>\n"),
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


                          
}













