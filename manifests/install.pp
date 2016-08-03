# Class: sudo::install
#
# This class manage the installation of the sudo package
class sudo::install {
  ensure_packages ( 'sudo', { 'ensure' => $sudo::params::ensure_mode, 'name' => $sudo::params::package_name } )
}
