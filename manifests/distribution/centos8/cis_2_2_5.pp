#
class secure_linux_cis::distribution::centos8::cis_2_2_5 {
  include secure_linux_cis::rules::ensure_SNMP_Server_is_not_enabled
}
