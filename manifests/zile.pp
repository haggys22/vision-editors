# Install and configure zile, a light emacslike editor
#
class vision_editors::zile {

  package { 'zile':
    ensure => 'present',
  }

  file { '/root/.zile':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/vision_editors/zile/zilerc',
  }

}
