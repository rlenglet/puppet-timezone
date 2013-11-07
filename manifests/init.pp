# == Class: timezone
#
# Setup and reconfigure the timezone on Debian
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
# Copyright 2013 Romain Lenglet
#
class timezone (
  $area='Etc',
  $zone='UTC') {

  debconf_package { tzdata:
    ensure => present,
    content => inline_template( "tzdata	tzdata/Areas	select	<%= @area %>
tzdata	tzdata/Zones/<%= @area %>	select	<%= @zone %>
"),
  }

  # Work around Debian bug #605834, where tzdata's debconf is overriten by
  # /etc/timezone.
  file { "/etc/timezone":
    content => inline_template('<%= @area + "/" + @zone + "\n" %>'),
    before => Exec["dpkg-reconfigure tzdata"],
    notify => Exec["dpkg-reconfigure tzdata"],
    owner => root,
    group => root,
    mode => "0644",
  }
}
