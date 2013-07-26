################################################################################
#
#   This directive allows to add new configurations for sudo
#   The directive name is used as filename for the sudo file.
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
#
# == Parameters
#   [+ensure+]
#       (OPTIONAL) (default: present)
#
#       this variable allows to choose if the directive must be present or absent
#
#   [+content+]
#       (OPTIONAL) (default: "")
#
#       this variable allows to set the +content+ string into the sudo file (+content+ or +source+ must be set)
#
#   [+source+]
#       (OPTIONAL) (default: "")
#
#       this variable allows to set the +source+ for the sudo file as a file, template ... (+content+ or +source+ must be set)
#
#
# == Examples
#
#    class {"sudo" : } ->
#    sudo::directive { "tqa":
#        ensure  => present,
#        source => "puppet:///modules/exo/etc/sudoers.d/tqa",
#        require => [Group['tqa','swf','sysadmin'],User['tqawork']],
#    }
################################################################################
define sudo::directive (
  $ensure  = present,
  $content = '',
  $source  = '') {
  require sudo

  # sudo skipping file names that contain a "."
  $dname = regsubst($name, '\.', '-', 'G')

  file { "${sudo::params::configuration_dir}/${dname}":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => 0440,
    content => $content ? {
      ''      => undef,
      default => "# ###################################\n# This file is managed by puppet\n# PLEASE DON'T MODIFY BY HAND\n# ###################################\n\n${content}",
    },
    source  => $source ? {
      ''      => undef,
      default => $source,
    },
    notify  => Exec["validate-sudo-file-${dname}"]
  }

  exec { "validate-sudo-file-${dname}":
    command     => "/usr/sbin/visudo -c -f ${sudo::params::configuration_dir}/${dname}",
    subscribe   => File["${sudo::params::configuration_dir}/${dname}"],
    refreshonly => true,
  }

}
