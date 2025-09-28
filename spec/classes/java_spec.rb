# frozen_string_literal: true

require 'spec_helper'

describe 'java', type: :class do
  context 'when selecting openjdk for CentOS 7.1.1503' do
    let(:facts) { { os: { family: 'RedHat', name: 'CentOS', release: { full: '7.1.1503' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1.8.0-openjdk-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.8.0/') }
  end

  context 'on Debian Buster (10.0)' do
    let(:facts) { { os: { family: 'Debian', name: 'Debian', lsb: { distcodename: 'buster' }, release: { major: '10' }, architecture: 'amd64' } } }

    context 'when selecting jdk' do
      let(:params) { { 'distribution' => 'jdk' } }

      it { is_expected.to contain_package('java').with_name('openjdk-11-jdk') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/') }
    end

    context 'when selecting jre' do
      let(:params) { { 'distribution' => 'jre' } }

      it { is_expected.to contain_package('java').with_name('openjdk-11-jre-headless') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/') }
    end
  end

  context 'on Debian Bookworm (12)' do
    let(:facts) { { os: { family: 'Debian', name: 'Debian', lsb: { distcodename: 'bookworm' }, release: { major: '12' }, architecture: 'amd64' } } }

    context 'when selecting jdk' do
      let(:params) { { 'distribution' => 'jdk' } }

      it { is_expected.to contain_package('java').with_name('openjdk-17-jdk') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64/') }
    end

    context 'when selecting jre' do
      let(:params) { { 'distribution' => 'jre' } }

      it { is_expected.to contain_package('java').with_name('openjdk-17-jre-headless') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64/') }
    end
  end

  context 'on Debian Trixie (13)' do
    let(:facts) { { os: { family: 'Debian', name: 'Debian', lsb: { distcodename: 'trixie' }, release: { major: '13' }, architecture: 'amd64' } } }

    context 'when selecting jdk' do
      let(:params) { { 'distribution' => 'jdk' } }

      it { is_expected.to contain_package('java').with_name('openjdk-21-jdk') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64/') }
    end

    context 'when selecting jre' do
      let(:params) { { 'distribution' => 'jre' } }

      it { is_expected.to contain_package('java').with_name('openjdk-21-jre-headless') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64/') }
    end
  end

  context 'on Ubuntu Bionic (18.04)' do
    let(:facts) { { os: { family: 'Debian', name: 'Ubuntu', lsb: { distcodename: 'bionic' }, release: { major: '18.04' }, architecture: 'amd64' } } }

    context 'when selecting jdk' do
      let(:params) { { 'distribution' => 'jdk' } }

      it { is_expected.to contain_package('java').with_name('openjdk-11-jdk') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/') }
    end

    context 'when selecting jre' do
      let(:params) { { 'distribution' => 'jre' } }

      it { is_expected.to contain_package('java').with_name('openjdk-11-jre-headless') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/') }
    end
  end

  context 'on Oracle Linux 7.0' do
    let(:facts) { { os: { family: 'RedHat', name: 'OracleLinux', release: { full: '7.0' }, architecture: 'x86_64' } } }

    context 'when selecting openjdk' do
      it { is_expected.to contain_package('java').with_name('java-1.7.0-openjdk-devel') }
    end

    context 'when selecting passed value for Oracle Linux' do
      let(:params) { { 'distribution' => 'jre' } }

      it { is_expected.to contain_package('java').with_name('java-1.7.0-openjdk') }
    end
  end

  context 'when selecting passed value for Scientific Linux' do
    let(:facts) { { os: { family: 'RedHat', name: 'Scientific', release: { full: '7.0' }, architecture: 'x86_64' } } }
    let(:params) { { 'distribution' => 'jre' } }

    it { is_expected.to contain_package('java').with_name('java-1.7.0-openjdk') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.7.0/') }
  end

  context 'when selecting passed value for Scientific Linux CERN (SLC)' do
    let(:facts) { { os: { family: 'RedHat', name: 'SLC', release: { full: '7.0' }, architecture: 'x86_64' } } }
    let(:params) { { 'distribution' => 'jre' } }

    it { is_expected.to contain_package('java').with_name('java-1.7.0-openjdk') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib/jvm/java-1.7.0/') }
  end

  context 'when selecting default for OpenSUSE 12.3' do
    let(:facts) { { os: { family: 'Suse', name: 'OpenSUSE', release: { full: '12.3', major: '12', minor: '3' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1_7_0-openjdk-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib64/jvm/java-1.7.0-openjdk-1.7.0/') }
  end

  context 'when selecting default for SLES 11.3' do
    let(:facts) { { os: { family: 'Suse', name: 'SLES', release: { full: '11.3', major: '11', minor: '3' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1_6_0-ibm-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib64/jvm/java-1.6.0-ibm-1.6.0/') }
  end

  context 'when selecting default for SLES 11.4' do
    let(:facts) { { os: { family: 'Suse', name: 'SLES', release: { full: '11.4', major: '11', minor: '4' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1_7_1-ibm-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib64/jvm/java-1.7.1-ibm-1.7.1/') }
  end

  context 'when selecting default for SLES 12.0' do
    let(:facts) { { os: { family: 'Suse', name: 'SLES', release: { full: '12.0', major: '12' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1_7_0-openjdk-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib64/jvm/java-1.7.0-openjdk-1.7.0/') }
  end

  context 'when selecting default for SLES 12.1' do
    let(:facts) { { os: { family: 'Suse', name: 'SLES', release: { full: '12.1', major: '12' }, architecture: 'x86_64' } } }

    it { is_expected.to contain_package('java').with_name('java-1_8_0-openjdk-devel') }
    it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/') }
  end

  describe 'custom java package' do
    let(:facts) { { os: { family: 'Debian', name: 'Debian', lsb: { distcodename: 'bullseye' }, release: { major: '11' }, architecture: 'amd64' } } }

    context 'when all params provided' do
      let(:params) do
        {
          'distribution' => 'custom',
          'package' => 'custom_jdk',
          'java_alternative' => 'java-custom_jdk',
          'java_alternative_path' => '/opt/custom_jdk/bin/java',
          'java_home' => '/opt/custom_jdk'
        }
      end

      it { is_expected.to contain_package('java').with_name('custom_jdk') }
      it { is_expected.to contain_file_line('java-home-environment').with_line('JAVA_HOME=/opt/custom_jdk') }
      it { is_expected.to contain_exec('update-java-alternatives').with_command(['update-java-alternatives', '--set', 'java-custom_jdk', '--jre']) }
    end

    context 'with missing parameters' do
      let(:params) do
        {
          'distribution' => 'custom',
          'package' => 'custom_jdk'
        }
      end

      it do
        expect { catalogue }.to raise_error Puppet::Error, %r{is not supported. Missing default values}
      end
    end
  end

  describe 'incompatible OSs' do
    [
      {
        os: {
          family: 'windows',
          name: 'windows',
          release: { full: '8.1' }
        }
      },
      {
        os: {
          family: 'Darwin',
          name: 'Darwin',
          release: { full: '13.3.0' }
        }
      },
      {
        os: {
          family: 'AIX',
          name: 'AIX',
          release: { full: '7100-02-00-000' }
        }
      },
      {
        os: {
          family: 'AIX',
          name: 'AIX',
          release: { full: '6100-07-04-1216' }
        }
      },
      {
        os: {
          family: 'AIX',
          name: 'AIX',
          release: { full: '5300-12-01-1016' }
        }
      },
    ].each do |facts|
      let(:facts) { facts }

      it "is_expected.to fail on #{facts[:os][:name]} #{facts[:os][:release][:full]}" do
        expect { catalogue }.to raise_error Puppet::Error, %r{unsupported platform}
      end
    end
  end
end
