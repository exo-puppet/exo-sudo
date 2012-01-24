# Class: sudo::service
#
# This class manage the sudo service
class sudo::service {
    service { "sudo":
        ensure     => running,
        name       => $sudo::params::service_name,
        hasstatus  => true,
        hasrestart => true,
        require => Class["sudo::config"],
    }
}