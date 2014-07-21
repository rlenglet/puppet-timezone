# == Class: timezone
#
# Configures the system timezone.
#
# === Parameters
#
# [*area*]
#   The timezone area, e.g. "America", "Europe", etc.
#
# [*zone*]
#   The timezone zone within the area, e.g. "Los_Angeles", "Paris", etc.
#
# === Examples
#
#  class { timezone:
#    area => America,
#    zone => Los_Angeles,
#  }
#
# == Authors
#
# Romain Lenglet <romain.lenglet@berabera.info>
#
# === Copyright
#
# Copyright 2013, 2014 Romain Lenglet
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class timezone (
  $area='Etc',
  $zone='UTC') {

  debconf_package { tzdata:
    ensure => present,
    content => "tzdata	tzdata/Areas	select	${area}
tzdata	tzdata/Zones/${area}	select	${zone}
",
  }

  # Work around Debian bug #605834, where tzdata's debconf is overwritten by
  # /etc/timezone.
  file { "/etc/timezone":
    content => "${area}/${zone}
",
    before => Exec["dpkg-reconfigure tzdata"],
    notify => Exec["dpkg-reconfigure tzdata"],
    owner => root,
    group => root,
    mode => "0644",
  }
}
