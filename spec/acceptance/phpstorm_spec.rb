require 'spec_helper_acceptance'

describe 'vision_editors::phpstorm' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE
        class { 'vision_editors::phpstorm':
        }
      FILE

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
