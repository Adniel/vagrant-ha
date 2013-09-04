define download_file($site="", $cwd="", $creates="", $require="", $user="") {

  exec { $name:
    command => "/usr/bin/wget -q ${site}/${name}",
    cwd => $cwd,
    creates => "${cwd}/${name}",
    require => $require,
    user => $user,
  }

}

class mikaelhg::rundeck {

  download_file { 'rundeck-1.6.1-1-GA.deb':
    site => 'http://download.rundeck.org/deb',
    cwd => '/tmp/',
    creates => '/tmp/rundeck-1.6.1-1-GA.deb',
    require => [],
    user => 'root'
  }

  package { 'openjdk-7-jdk':
    ensure => latest
  }

  package { 'rundeck':
    provider => 'dpkg',
    ensure => latest,
    source => '/tmp/rundeck-1.6.1-1-GA.deb',
    require => [
      Package['openjdk-7-jdk'],
      Download_file['rundeck-1.6.1-1-GA.deb']
    ]
  }
  
}

class mikaelhg::puppetmaster {

  package { 'puppetmaster':
    ensure => latest
  }

  service { 'puppetmaster':
    ensure => running,
    require => [
      Package['puppetmaster'],
      File['/etc/puppet/manifests'],
      File['/etc/puppet/modules'],
      File['/etc/puppet/templates'],
      File['/etc/puppet/autosign.conf']
    ]
  }

  file { '/etc/puppet/manifests':
    ensure => link,
    force => true,
    target => '/vagrant/puppetmaster/manifests',
    require => Package['puppetmaster']
  }
  
  file { '/etc/puppet/modules':
    ensure => link,
    force => true,
    target => '/vagrant/puppetmaster/modules',
    require => Package['puppetmaster']
  }

  file { '/etc/puppet/templates':
    ensure => link,
    force => true,
    target => '/vagrant/puppetmaster/templates',
    require => Package['puppetmaster']
  }
  
  file { '/etc/puppet/autosign.conf':
    content => '*.mikaelhg.dev'
  }
  
}

node 'admin.mikaelhg.dev' {

  include mikaelhg::rundeck
  include mikaelhg::puppetmaster

}

node 'cia.mikaelhg.dev' {
}

node 'app1.mikaelhg.dev' {
}

node 'app2.mikaelhg.dev' {
}
