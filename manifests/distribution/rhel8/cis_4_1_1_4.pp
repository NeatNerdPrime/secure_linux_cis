#
class secure_linux_cis::distribution::rhel8::cis_4_1_1_4 {
  include secure_linux_cis::rules::ensure_audit_backlog_limit_is_sufficient
}
