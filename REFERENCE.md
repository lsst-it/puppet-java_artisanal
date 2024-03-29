# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`java_artisanal`](#java_artisanal): Install jdk via RPMs
* [`java_artisanal::java17`](#java_artisanal--java17): Install jdk 17 via RPMs

## Classes

### <a name="java_artisanal"></a>`java_artisanal`

Install jdk via RPMs

#### Parameters

The following parameters are available in the `java_artisanal` class:

* [`source`](#-java_artisanal--source)
* [`package`](#-java_artisanal--package)
* [`dir`](#-java_artisanal--dir)
* [`set_alternatives`](#-java_artisanal--set_alternatives)

##### <a name="-java_artisanal--source"></a>`source`

Data type: `Stdlib::HTTPUrl`

URL to JDK rpm

Default value: `'https://github.com/frekele/oracle-java/releases/download/8u202-b08/jdk-8u202-linux-x64.rpm'`

##### <a name="-java_artisanal--package"></a>`package`

Data type: `String`

String naming the package installed by the rpm; eg jdk1.8.
In older rpms, this had a version suffix, eg: jdk1.8.0_112

Default value: `'jdk1.8'`

##### <a name="-java_artisanal--dir"></a>`dir`

Data type: `String`

String giving the install directory in /usr/java; eg jdk1.8.0_251-amd64.
The -amd64 suffix is a semi-recent addition, eg
https://bugs.openjdk.java.net/browse/JDK-8202320
The ever-changing world of java rpms:
https://bugs.openjdk.java.net/browse/JDK-8202528
TODO this seems like something we should derive.

Default value: `'jdk1.8.0_202-amd64'`

##### <a name="-java_artisanal--set_alternatives"></a>`set_alternatives`

Data type: `Boolean`

If false, do not set the /usr/bin alternatives to point to this version.

Default value: `true`

### <a name="java_artisanal--java17"></a>`java_artisanal::java17`

Install jdk 17 via RPMs

#### Parameters

The following parameters are available in the `java_artisanal::java17` class:

* [`source`](#-java_artisanal--java17--source)
* [`package`](#-java_artisanal--java17--package)
* [`version`](#-java_artisanal--java17--version)
* [`set_alternatives`](#-java_artisanal--java17--set_alternatives)
* [`source_user`](#-java_artisanal--java17--source_user)
* [`source_pass`](#-java_artisanal--java17--source_pass)

##### <a name="-java_artisanal--java17--source"></a>`source`

Data type: `String`

String giving source URL for rpm.

Default value: `'https://cdn.azul.com/zulu/bin/zulu17.34.19-ca-jdk17.0.3-linux.x86_64.rpm'`

##### <a name="-java_artisanal--java17--package"></a>`package`

Data type: `String`

String naming the package installed by the rpm; eg zulu-17.

Default value: `'zulu-17'`

##### <a name="-java_artisanal--java17--version"></a>`version`

Data type: `String`

String giving version of installed rpm.

Default value: `'17.34+19'`

##### <a name="-java_artisanal--java17--set_alternatives"></a>`set_alternatives`

Data type: `Boolean`

If true, set the /usr/bin alternatives to point to this version.

Default value: `!$java_artisanal::set_alternatives`

##### <a name="-java_artisanal--java17--source_user"></a>`source_user`

Data type: `Optional[String]`

Optional string giving username to access source URL.

Default value: `undef`

##### <a name="-java_artisanal--java17--source_pass"></a>`source_pass`

Data type: `Optional[String]`

Optional string giving password to access source URL.

Default value: `undef`

