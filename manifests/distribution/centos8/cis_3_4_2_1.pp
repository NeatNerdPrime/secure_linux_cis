#
class secure_linux_cis::distribution::centos8::cis_3_4_2_1 {
  include secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running
}
