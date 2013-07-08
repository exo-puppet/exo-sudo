# Class: sudo::install
#
# This class manage the installation of the sudo package
class sudo::install {
  package { 'sudo':
    ensure  => $sudo::params::ensure_mode,
    name    => $sudo::params::package_name,
    require => [
      Exec['repo-update'],],
  }
}
