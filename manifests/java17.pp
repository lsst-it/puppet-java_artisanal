#
# @summary Install jdk 17 via RPMs
#
# @param rpm
#   Name of the rpm to install.
#
# @param package
#   String naming the package installed by the rpm; eg zulu-17.
#
class java_artisanal::java17 (
  String $rpm = 'zulu17.x86_64.rpm',
  String $package = 'zulu-17',
) {
  $rpmfile = "/var/tmp/${rpm}"

  archive { $rpmfile:
    ensure   => present,
    source   => "${java_artisanal::pkgurl}/${rpm}",
    username => $java_artisanal::pkgurl_user,
    password => $java_artisanal::pkgurl_pass,
  }

  package { $package:
    ensure   => 'latest',
    provider => 'rpm',
    source   => $rpmfile,
  }
}
