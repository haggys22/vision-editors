# Install Intellij Idea IDE
class vision_editors::intellij_idea (
  String  $base_url,
  String  $version,
  String  $install_target,
  Integer $timeout,
){
  $url      = "${base_url}ideaIC-${version}.tar.gz"
  $filename = "${install_target}/ideaIC-${version}.tar.gz"

  archive { $filename:
    ensure          => present,
    source          => $url,
    checksum_verify => false,
    extract         => true,
    extract_command => "mkdir ${install_target}/idea-${version} && tar xfz %s --strip-components=1 -C ${install_target}/idea-${version}/ && chown -R root:root ${install_target}/idea-${version}", # lint:ignore:140chars
    extract_path    => $install_target,
  }

  file { "${install_target}/idea":
    ensure    => link,
    target    => "${install_target}/idea-${version}",
    subscribe => Archive[$filename],
  }

  file { '/usr/local/bin/idea':
    ensure    => link,
    target    => "${install_target}/idea/bin/idea.sh",
    subscribe => Archive[$filename],
  }
}
