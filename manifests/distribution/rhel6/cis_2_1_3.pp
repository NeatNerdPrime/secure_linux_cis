#
class secure_linux_cis::distribution::rhel6::cis_2_1_3 {
  include secure_linux_cis::rules::ensure_discard_services_are_not_enabled
}
