#
class secure_linux_cis::distribution::ubuntu18::cis_1_6_1_3 {
  include secure_linux_cis::rules::ensure_selinux_policy_is_configured
}
