This is a wrapper around the package provider, that gives an example of how
to emulate additional switches and manually pass them to yum.

Installation
============

Copy this entire directory as is into:

    /etc/puppetlabs/puppet/modules/yumwrapper

This could be a module of course, but as this is more of an example I haven't bothered this time.

Usage
=====

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
