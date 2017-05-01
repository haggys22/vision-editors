# Install vim and set it up for root
#
class vision_editors::vim (

  String  $theme_url,
  String  $pathogen_url,
  Boolean $manage_git_package,
  String  $git_package_name,

){

  contain ::vim

  if $manage_git_package {
    package { $git_package_name:
      ensure => 'installed',
    }
  }

  file { ['/root/.vim', '/root/.vim/bundle', '/root/.vim/autoload']:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

  vcsrepo { '/root/.vim/bundle/vim-colors-vision':
    ensure   => present,
    provider => git,
    source   => $theme_url,
    require  => File['/root/.vim/bundle'],
  }

  file { '/root/.vimrc':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/vision_editors/vim/root.rc',
    require => File['/root/.vim'],
  }

  vcsrepo { '/tmp/pathogen':
    ensure   => present,
    provider => git,
    source   => $pathogen_url,
    require  => File['/root/.vim/autoload'],
  }
  -> exec { 'copy pathogen':
    command => '/bin/cp /tmp/pathogen/autoload/pathogen.vim /root/.vim/autoload/pathogen.vim',
    creates => '/root/.vim/autoload/pathogen.vim',
  }

}
