require 'spec_helper'
require 'hiera'

describe 'vision_editors::nano' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'compile' do
        it { is_expected.to compile.with_all_deps }
      end

      # This test does not work, because Puppet 'mirrors' the emacs directory, but doesn't actually know the contents of it
      # Therefore, these files "are not in the catalogue" -- henschjk
      #
      # context 'install configuration' do
      #   it {
      #     is_expected.to contain_file('/root/.emacs.d/init.el').with_source('puppet:///modules/vision_editors/emacs/init.el')
      #     is_expected.to contain_file('/root/.emacs.d/packages.el').with_source('puppet:///modules/vision_editors/emacs/packages.el')
      #   }
      # end
    end
  end
end
