require 'spec_helper_acceptance'

describe 'vision_editors::emacs' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
                class { 'vision_editors::emacs':
                }
             EOS
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'Emacs installed' do
    describe package('emacs-nox') do
      it { is_expected.to be_installed }
    end
  end

  context 'install default config' do
    describe file('/root/.emacs.d/') do
      it { is_expected.to be_directory }
    end

    describe file('/root/.emacs.d/init.el') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match 'This file is managed by Puppet' }
      its(:content) { is_expected.to match "(provide 'init)" }
    end

    describe file('/root/.emacs.d/packages.el') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match 'This file is managed by Puppet' }
      its(:content) { is_expected.to match "(provide 'packages)" }
    end
  end

  context 'install emacs packages' do
    describe file('/root/.emacs.d/elpa/') do
      it { is_expected.to be_directory }
    end
  end
end
