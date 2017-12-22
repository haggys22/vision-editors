require 'spec_helper_acceptance'

describe 'vision_editors::vim' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
        class { 'vision_editors::vim':
            manage_git_package => true
        }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'files provisioned' do
    describe file('/root/.vimrc') do
      it { is_expected.to contain 'execute pathogen#infect()' }
      it { is_expected.to contain 'This file is managed by puppet' }
      it { is_expected.to be_mode 644 }
    end
    describe file('/root/.vim/bundle/vim-colors-vision') do
      it { is_expected.to be_directory }
    end
    describe file('/root/.vim/autoload/pathogen.vim') do
      it { is_expected.to be_file }
    end
  end
end
