

node admin.mikaelhg.dev {

  package { 'puppetmaster':
    ensure => latest
  }

  package { 'rundeck':
    provider => 'dpkg',
    source => 'http://download.rundeck.org/deb/rundeck-1.6.1-1-GA.deb'
  }

}
