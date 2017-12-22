# Install and configure nano for root

class vision_editors::nano (

  String  $nanorc_repo,
  Boolean $manage_git_package,
  String  $git_package_name,

){

  if !defined(Package['nano']) {
    package { 'nano':
      ensure => present,
    }
  }

  if $manage_git_package {
    package { $git_package_name:
      ensure => present,
    }
  }

  # Get nanorc from GitHub
  vcsrepo { '/usr/local/share/nano':
    ensure   => present,
    provider => git,
    source   => $nanorc_repo,
  }

  file { '/root/.nanorc':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => file('vision_editors/nano/root.nanorc'),
  }

}
