require 'spec_helper'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      # Architecture fact not included
      os_facts[:os]['architecture'] = 'x64'

      os_facts[:networking] = {}
      os_facts[:networking]['interfaces'] = {}
      os_facts[:networking]['network'] = '192.168.1.0'
      os_facts[:networking]['netmask'] = '255.255.255.0'

      let(:facts) { os_facts }

      let(:params) do
        {
          'time_servers' => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type' => 'server',
        }
      end

      it { is_expected.to compile }

      # If you need to specify any operating system specific tests
      case os_facts[:osfamily]
      when 'RedHat'
        case os_facts[:operatingsystemmajrelease]
        when '8'
          it { is_expected.to contain_package('firewalld') }
          it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_zone_is_set') }
        else
          it { is_expected.not_to contain_package('firewalld') }
        end
      # when 'Debian'
      #   case os_facts[:operatingsystemmajrelease]
      #   when '8'
      #     puts os_facts
      #   end
      end

      # Do not believe hiera can interprolate properly
#       it {
#         is_expected.to contain_file('/etc/hosts.allow').with(
#           'content' => 'sshd: ALL
# ALL: 192.168.1.0/255.255.255.0
# ',
#         )
#       }

#       it {
#         is_expected.to contain_file('/etc/hosts.deny').with(
#           'content' => 'ALL: ALL
# ',
#         )
#       }

      # it {
      #   is_expected.to contain_reboot('after_run')
      # }
    end

    # context "on #{os} no time servers" do
    #   # Architecture fact not included
    #   os_facts[:os]['architecture'] = 'x64'

    #   let(:facts) { os_facts }

    #   it { is_expected.not_to compile }
    # end
  end
end
