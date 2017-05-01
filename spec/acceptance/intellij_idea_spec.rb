require 'spec_helper_acceptance'

describe 'vision_editors::intellij_idea' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
        file { '/tmp/ideaIC-2016.1.2.tar.gz':
            source => 'puppet:///modules/vision_editors/ideaIC-2016.1.2.tar.gz',
        }

        class { 'vision_editors::intellij_idea':
            base_url       => '/tmp/',
            version        => '2016.1.2',
            install_target => '/opt',
            timeout        => 1200,
            require        => File['/tmp/ideaIC-2016.1.2.tar.gz'],
        }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'files provisioned' do
    describe file('/opt/idea/bin/idea.sh') do
      it { is_expected.to be_file }
    end

    describe file('/usr/local/bin/idea') do
      it { is_expected.to be_file }
    end
  end
end
