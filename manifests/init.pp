define yumwrapper (
  $ensure = 'present',
  $enablerepo = undef
  ) {

  if $enablerepo {
    case $ensure {
      'present', 'installed': {
        $yum_name = "yum_install_${name}"
        exec { $yum_name:
          command => "yum install -y --enablerepo=${enablerepo} ${name}",
          unless => "rpm -q ${name}",
          path => ['/usr/bin', '/bin'],
          logoutput => on_failure,
        }

        # Create a package resource, this effectively does nothing but create
        # a graph node for the package that was manually installed above.
        package { $name:
          ensure => present,
          require => Exec[$yum_name],
        }
      }
      'absent': {
        package { $namevar:
          ensure => 'absent',
        }
      }
      default: {
        fail("Only present, installed or absent is accepted")
      }
    }
  } else {
    package { $namevar:
      ensure => $ensure,
      provider => 'yum',
    }
  }
}
