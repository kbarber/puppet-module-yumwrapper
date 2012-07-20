This is a wrapper around the package provide, that gives an example of how
to emulate additional switches and manually pass them to yum.

== Usage

To install a package normally:

    yumwrapper { 'lynx':
      ensure => 'installed',
    }

To install a package with a custom enable repo:

    yumwrapper { 'lynx':
      ensure => 'installed',
      enablerepo => 'epel',
    }

Uninstall:

    yumwrapper { 'lynx':
      ensure => 'absent',
    }
