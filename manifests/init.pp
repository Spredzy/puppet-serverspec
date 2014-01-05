# == Class: serverspec
#
# A puppet module that installs and configure serverspec
#
# === Parameters
#
# [*ensure*]
#  (string) The value to pass to the package ressource
#
# [*provider*]
#  (string) The value to pass to the package ressource
#
# [*rootdir*]
#  (string) Path to store the serverspec specs file
#
# === Authors
#
# Yanis Guenane <yguenane@gmail.com>
#
# === Copyright
#
# Copyright 2014 Yanis Guenane, unless otherwise noted.
#
class serverspec (
  $ensure   = 'present',
  $provider = 'gem',
  $rootdir  = '/etc/puppet/serverspec',
){

  package {'serverspec':
    ensure   => present,
    provider => 'gem',
  }

  package {'rubygem-rake':
    ensure => present,
  }

  file {$rootdir:
    ensure => directory,
  }

}
