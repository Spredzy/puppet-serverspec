define serverspec::server (
  $fqdn        = $name,
  $type        = 'local',
  $speems_ip   = undef,
  $speems_port = undef,
  $rootdir     = '/etc/puppet/serverspec',
) {

  include serverspec

  $spec_helper = "spec_helper_${type}.rb"
  $hostname    = values_at(split($fqdn, '.'), 0)

  file {"${rootdir}/${fqdn}":
    ensure => directory,
  } ->
  file {"${rootdir}/${fqdn}/spec":
    ensure => directory,
  } ->
  file {"${rootdir}/${fqdn}/spec/${hostname}":
    ensure => directory,
  } ->
  file {"${rootdir}/${fqdn}/Rakefile":
    ensure  => file,
    source  => 'puppet:///modules/serverspec/Rakefile',
  } ->
  file {"${rootdir}/${fqdn}/spec/spec_helper.rb":
    ensure  => file,
    source  => "puppet:///modules/serverspec/${spec_helper}",
  }

  if $speems_ip and $speems_port {
    exec {"/usr/bin/curl -H 'x-hostname: ${fqdn}' ${speems_ip}:${speems_port} > ${rootdir}/${fqdn}/spec/${hostname}/${hostname}_spec.rb" :
    }
  } else {
    file {"${rootdir}/${fqdn}/spec/${hostname}/${hostname}_spec.rb":
      ensure  => present,
      source  => "puppet:///modules/serverspec/spec.d/${hostname}_spec.rb",
    }
  }

}
