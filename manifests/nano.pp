# Install and configure nano for root
class vision_editors::nano (
  String  $nanorc_repo,
  Boolean $manage_git_package,
  String  $git_package_name,
  ){

  package { 'nano':
    ensure => 'installed',
  }

  if $manage_git_package {
    package { $git_package_name:
      ensure => 'installed',
    }
  }
  vcsrepo { '/usr/local/share/nano':
    ensure   => present,
    provider => git,
    source   => $nanorc_repo,
  }

  file { '/root/.nanorc':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/vision_editors/nano/root.nanorc',
  }

}
