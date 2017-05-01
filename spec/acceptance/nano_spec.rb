require 'spec_helper_acceptance'

describe 'vision_editors::nano' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
                class { 'vision_editors::nano':
                  nanorc_repo        => 'git://github.com/scopatz/nanorc.git',
                  manage_git_package => true,
                  git_package_name   => 'git',
                }
             EOS
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'nano installed' do
    describe package('nano') do
      it { is_expected.to be_installed }
    end
  end

  context 'clone nano syntax files' do
    describe file('/usr/local/share/nano') do
      it { is_expected.to be_directory }
    end

    describe file('/usr/local/share/nano/.git') do
      it { is_expected.to be_directory }
    end
  end

  context 'use nanorc file' do
    describe file('/root/.nanorc') do
      its(:content) { is_expected.to match 'This file is managed by puppet' }
      its(:content) { is_expected.to match 'include /usr/local/share/nano/zsh.nanorc' }
      its(:content) { is_expected.to match 'set tabsize 2' }
    end
  end
end
