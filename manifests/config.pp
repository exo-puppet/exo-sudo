# Class: sudo::config
#
# This class manage the sudo configuration
class sudo::config {
    file {
        "${sudo::params::configuration_dir}/${sudo::sudo_role}" :
            owner => root,
            group => root,
            mode => 440,
            source => "puppet:///modules/sudo/${sudo::sudo_role}-sudoers",
            require => Class["sudo::install"],
            notify => Class["sudo::service"],
            ensure => file,
    }
}
