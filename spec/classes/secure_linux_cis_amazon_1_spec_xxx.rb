require 'spec_helper'

describe 'secure_linux_cis' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'           => 'Amazon',
        'operatingsystemmajrelease' => ['2016'],
      },
    ],
  }

  on_supported_os(test_on).each do |os, os_facts|

    puts "\n##########>  #{os}  <##########\n\n"
    
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

    it { is_expected.to compile.with_all_deps }

  end
end
