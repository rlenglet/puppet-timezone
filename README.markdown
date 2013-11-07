#timezone

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with timezone](#setup)
    * [What timezone affects](#what-timezone-affects)
    * [Beginning with timezone](#beginning-with-timezone)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [License]

##Overview

(Re)configures the timezone on Debian.

##Module Description

The `timezone` class sets the timezone on Debian.

##Setup

###What timezone affects

* `tzdata` Debian package.
* Timezone configuration file.

###Beginning with timezone	

Just include `timezone`, or optionally pass the timezone area and zone
attributes (which default to `Etc`/`UTC`).

##Usage

To specify the optional `area` and `zone` attributes for the PST
timezone:

```puppet
class { timezone:
  area => America,
  zone => Los_Angeles,
}
```

##Reference

###Class

* `timezone`: Main class.

###Attributes

####`area`

The general area of the timezone, e.g. `Europe`, `America`, etc.  If
not specified, defaults to `Etc`.

####`zone`

The timezone within the area, e.g. `Paris`, `Los_Angeles`, etc.  If
not specified, defaults to `UTC`.

##Limitations

This module is compatible only with Debian and Ubuntu.

##Development

Feedback and contributions are appreciated, in the form of issues or
pull requests on [the Github project
page](https://github.com/rlenglet/puppet-timezone).

##License

Copyright 2013 Romain Lenglet

Licensed under the Apache License, Version 2.0 (the "License"); you
may not use this file except in compliance with the License.  You may
obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied.  See the License for the specific language governing
permissions and limitations under the License.