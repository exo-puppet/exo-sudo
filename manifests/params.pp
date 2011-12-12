# Class: sudo::params
#
# This class manage the sudo parameters for different OS
class sudo::params {
	
	$ensure_mode = $sudo::lastversion ? {
		true => latest,
		default => present
	}
	info ("sudo ensure mode = $ensure_mode")
	

	case $::operatingsystem {
		/(Ubuntu|Debian)/: {
            $package_name       = ["sudo"]
            $service_name       = "sudo"
            $configuration_dir  = "/etc/sudoers.d"
		}
		default: {
			fail ("The ${module_name} module is not supported on $::operatingsystem")
		}
	}
}
