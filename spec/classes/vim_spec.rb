require 'spec_helper'
require 'hiera'

describe 'vision_editors::vim' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'compile' do
        it { is_expected.to compile.with_all_deps }
      end

      context 'create all directories' do
        ['/root/.vim', '/root/.vim/bundle', '/root/.vim/autoload'].each do |f|
          it do
            is_expected.to contain_file(f).with('owner' => 'root')
          end
        end
      end

      context 'clone vim theme' do
        it do
          is_expected.to contain_vcsrepo('/root/.vim/bundle/vim-colors-vision')
        end
      end

      context 'use own vim file' do
        it do
          is_expected.to contain_file('/root/.vimrc').with_source('puppet:///modules/vision_editors/vim/root.rc')
        end
      end
    end
  end
end
