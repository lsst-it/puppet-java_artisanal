# java_artisanal

![Build Status](https://travis-ci.com/lsst-it/puppet-java_artisanal.svg?branch=master)](https://travis-ci.com/lsst-it/puppet-java_artisanal)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with java_artisanal](#setup)
    * [What java_artisanal affects](#what-java_artisanal-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Description

This module installs `java` via a direct HTTP[S] URL and configures the
appropriate alternatives command aliases.

## Setup

### What java_artisanal affects

* installs a java RPM package
* manages alternatives links for java related commands. Eg., `java`, `jar`, etc.

### Setup Requirements

None.

## Usage

### Basic Example

```puppet
include java_artisanal

Class['java_artisanal'] -> Class['my_mod_that_needs_java']
```

### Pedantic Example

```yaml
---
classes:
  - "java_artisanal"

java_artisanal::source: "https://.../jdk-8u202-linux-x64.rpm"
java_artisanal::package: "jdk1.8"
java_artisanal::dir: "jdk1.8.0_202-amd64"
```

## Reference

See [REFERENCE](REFERENCE.md).
