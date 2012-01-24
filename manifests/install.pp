# Class: sudo::install
#
# This class manage the installation of the sudo package
class sudo::install {
    package { "sudo" :
        name    => $sudo::params::package_name,
        ensure  => $sudo::params::ensure_mode,
        require => [ Exec ["repo-update"],],
    }
}
