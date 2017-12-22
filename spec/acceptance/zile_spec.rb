require 'spec_helper_acceptance'

describe 'vision_editors::zile' do
  context 'with defaults' do
    it 'run idempotently' do
      pp = <<-FILE
                class { 'vision_editors::zile': }
             FILE
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'packages installed' do
    describe package('zile') do
      it { is_expected.to be_installed }
    end
  end

  context 'files provisioned' do
    describe file('/root/.zile') do
      its(:content) { is_expected.to match 'This file is managed by Puppet' }
      its(:content) { is_expected.to match 'make-backup-files nil' }
    end
  end
end
