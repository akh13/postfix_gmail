class postfix_gmail::config {

$myhostname = $postfix_gmail::myhostname 
$sslcert = $postfix_gmail::sslcert
$sslkey = $postfix_gmail::sslkey
$cacert = $postfix_gmail::cacert
$username = $postfix_gmail::username
$password = $postfix_gmail::password
$interfaces = $postfix_gmail::interfaces
$destinations = join($postfix_gmail::destinations,",")
$networks = join($postfix_gmail::networks,",")

  file { '/etc/postfix/sasl_passwd':
    ensure => file,
    mode => 'u=rw,g=rw',
    owner => root,
    group => root,
    content => template("postfix_gmail/sasl_passwd.erb"),
  }

  file { '/etc/postfix/main.cf':
    ensure => file,
    mode => 'u=rw,g=rw',
    owner => root,
    group => root,
    content => template("postfix_gmail/main.erb"),
    notify => Service['postfix'],
  }
  
  exec { 'Create password' :
     command => 'postmap /etc/postfix/sasl_passwd',
     path => ['/usr/sbin'],
     user => 'root',
     cwd => '/etc/postfix',
     creates => '/etc/postfix/sasl_passwd.db',
     notify => Service['postfix'],
  }

  exec { 'Refresh password' :
     command => 'postmap /etc/postfix/sasl_passwd',
     path => ['/usr/sbin'],
     user => 'root',
     cwd => '/etc/postfix',
     creates => '/etc/postfix/sasl_passwd.db',
     subscribe => File['/etc/postfix/sasl_passwd'],
     refreshonly => true,
     notify => Service['postfix'],
  }

  service { 'postfix':
    ensure => running,
    enable => true,
  }
}
