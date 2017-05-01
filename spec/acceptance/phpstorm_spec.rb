require 'spec_helper_acceptance'

describe 'vision_editors::phpstorm' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
        file { '/tmp/PhpStorm-2016.1.2.tar.gz':
            source => 'puppet:///modules/vision_editors/PhpStorm-2016.1.2.tar.gz',
        }

        class { 'vision_editors::phpstorm':
            base_url       => '/tmp/',
            version        => '2016.1.2',
            install_target => '/opt',
            timeout        => 1200,
            require        => File['/tmp/PhpStorm-2016.1.2.tar.gz'],
        }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'files provisioned' do
    describe file('/opt/phpstorm/bin/phpstorm.sh') do
      it { is_expected.to be_file }
    end

    describe file('/usr/local/bin/phpstorm') do
      it { is_expected.to be_file }
    end
  end
end
