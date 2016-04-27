class memcached {
  file { 'memcached':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/sysconfig/memcached'
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached],
  }
  
  package { 'memcached':
    ensure => present,
  }
  
  service { 'memcached':
    ensure => running,
    enable => true,
    subscribe => File['memcached],
  }
}
