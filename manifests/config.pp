# Class: sudo::config
#
# This class manage the sudo configuration
class sudo::config {
    #
    # Use the #includedir directive to manage sudoers.d, version >= 1.7.2
    # 
    file {"${sudo::params::configuration_dir}" :
      ensure  => directory,
      owner   => root,
      group   => root,
      mode    => 755,
      purge   => true,
      recurse => true,
    }
}
