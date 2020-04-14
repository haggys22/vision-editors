# Class: vision_editors:zile
# ===========================
#
# Install and configure zile, a light emacslike editor
#
# Parameters
# ----------
#

class vision_editors::zile {

  if !defined(Package['zile']) {
    package { 'zile':
      ensure => present,
    }
  }

  file { '/root/.zile':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => file('vision_editors/zile/zilerc'),
  }

}
