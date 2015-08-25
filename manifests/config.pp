# == Class: activemq::config
class activemq::config {
  file { '/etc/default/activemq':
    ensure  => present,
    owner   => 'activemq',
    group   => 'activemq',
    mode    => '0644',
    content => template('activemq/default.erb'),
    require => Package['activemq'],
    notify  => Service['activemq'],
  }

  file { ['/var/lib/activemq', '/etc/activemq']:
    ensure  => directory,
    owner   => 'activemq',
    group   => 'activemq',
    mode    => '0644',
    recurse => true,
  }

}
