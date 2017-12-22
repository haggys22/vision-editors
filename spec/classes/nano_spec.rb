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

      context 'clone nanorc repo' do
        it do
          is_expected.to contain_vcsrepo('/usr/local/share/nano')
        end
      end
    end
  end
end
