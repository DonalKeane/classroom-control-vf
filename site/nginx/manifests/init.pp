Class{
  package { 'ntp':
    ensure => present,
  }
    file { '/etc/ntp.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/ntp/ntp.conf',
    require => Package['ntp'],
  }
    service { 'ntpd':
    ensure => running,
    enable => true,
    subscribe => File['/etc/ntp.conf'],
  }
}
