class postfix_gmail::packages {

  $packages = [ 'postfix', 'mailutils', 'libsasl2-2' ]

  package { $packages: ensure => 'installed'}

}
