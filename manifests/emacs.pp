# Install and configure Emacs for root
class vision_editors::emacs {

  # Install base package(s)
  package { 'emacs':
    ensure => 'installed',
    name   => 'emacs-nox'
  }

  # Copy configuration
  file { 'configuration':
    ensure  => 'directory',
    path    => '/root/.emacs.d/',
    owner   => root,
    group   => root,
    purge   => false,
    recurse => 'remote',
    source  => 'puppet:///modules/vision_editors/emacs/',
    notify  => Exec['packages']
  }

  # Install Packages from (M)ELPA
  exec { 'packages':
    require     => [ File['configuration'], Package['emacs'] ],
    user        => 'root',
    # Puppet does not run its execs in a real shell,
    # but rather executes them directly. Therefore,
    # env vars like PATH and HOME are missing.
    # Setting this manually tells Emacs where to install
    # the packages (otherwise HOME='') -- henschjk
    environment => ['HOME=/root'],
    command     => '/usr/bin/emacs --batch -l /root/.emacs.d/packages.el',
    creates     => '/root/.emacs.d/elpa/'
  }

}
