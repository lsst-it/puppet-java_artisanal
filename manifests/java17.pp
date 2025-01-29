#
# @summary Install jdk 17 via RPMs
#
# @param source
#   String giving source URL for rpm.
#
# @param package
#   String naming the package installed by the rpm; eg zulu-17.
#
# @param version
#   String giving version of installed rpm.
#
# @param set_alternatives
#   If true, set the /usr/bin alternatives to point to this version.
#
# @param source_user
#   Optional string giving username to access source URL.
#
# @param source_pass
#   Optional string giving password to access source URL.
#
class java_artisanal::java17 (
  String           $source      = 'https://cdn.azul.com/zulu/bin/zulu17.34.19-ca-jdk17.0.3-linux.x86_64.rpm',
  String           $package     = 'zulu-17',
  String           $version     = '17.34+19',
  Boolean          $set_alternatives = !$java_artisanal::set_alternatives,
  Optional[String] $source_user = undef,
  Optional[String] $source_pass = undef,
) {
  $rpmfile = "/var/tmp/${package}-${version}.rpm"

  archive { $rpmfile:
    ensure   => present,
    source   => $source,
    username => $source_user,
    password => $source_pass,
  }

  package { $package:
    ensure   => $version,
    provider => 'rpm',
    source   => $rpmfile,
  }

  $cmds = [
    'java',
    'javac',
#    'javaws',
    'jar',
    'jconsole',
    'jstack',
  ]

  $cmds.each |$cmd| {
    $src = "/usr/bin/${cmd}"
    $dest = "/usr/lib/jvm/zulu-17/bin/${cmd}"

    alternative_entry { $dest:
      ensure   => present,
      altlink  => $src,
      altname  => $cmd,
      priority => 900,
      require  => Package[$package],
    }

    if $set_alternatives {
      alternatives { $cmd:
        path => $dest,
      }

      ## If something removes a /usr/bin symlink managed by alternatives,
      ## but does not change the preferred alternative,
      ## the above by itself does not recreate the /usr/bin link.
      ## Eg it seems as if updates to the system java-11-openjdk-headless
      ## rpm can do this (see postinstall script).
      file { $src:
        ensure => link,
        target => "/etc/alternatives/${cmd}",
      }
    }
  }
}
