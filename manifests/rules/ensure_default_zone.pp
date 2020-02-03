# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_default_zone
class secure_linux_cis::rules::ensure_default_zone(
    Boolean $enforced = true,
) {
  if $enforced {
    class { '::firewalld':
      default_zone              => 'drop',
      purge_direct_rules        => true,
      purge_direct_chains       => true,
      purge_direct_passthroughs => true,
    }
  }
}
