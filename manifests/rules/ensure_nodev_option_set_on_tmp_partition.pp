#  Ensure nodev option set on /tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary  Ensure nodev option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nodev_option_set_on_tmp_partition
class secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition(
    Boolean $enforced = true,
) {
  if $enforced {
    $mount = '/tmp'
    $option = 'nodev'
    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }
  }
}
