################################################################################
#
#   This module manages sudo.
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
#
# == Parameters
#   [+lastversion+]
#       (OPTIONAL) (default: false)
#
#       this variable allow to chose if the package should always be updated to the last available version (true) or not (false)
#       (default: false)
#
# == Modules Dependencies
#
# [+repo+]
#   the +repo+ puppet module is needed to :
#
#   - refresh the repository before installing package (in sudo::install)
#
# == Examples
#
#   class { "sudo":
#       lastversion => true,
#   }
#
################################################################################
class sudo (
  $lastversion = false) {
  # parameters validation
  if ($lastversion != true) and ($lastversion != false) {
    fail('lastversion must be true or false')
  }

  include repo
  include sudo::params, sudo::install, sudo::config
}
