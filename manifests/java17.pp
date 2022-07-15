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
}
