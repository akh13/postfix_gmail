# Class: postfix_gmail
# ===========================
#
# Full description of class postfix_gmail here.
#
# Parameters
# ----------
#
# This class is fairly limited, it requires username and password only.
#
# * `username`
#  This is your GMail username in the form `username@gmail.com`
# * `password`
#  Your password
# * `myhostname`
#  The hostname of the mailserver
# * `sslcert`
#  Specified SSL cert
# * `sslkey`
#  Specified SSL key
# * `cacert`
#  Specified CA certificates file
# * `interfaces`
#  Specified interfaces for postfix to listen
# * `destinations`
# Corresponds to the mydestinations setting in main.cf
# * `networks`
# Corresponds to the authorized networks in mynetworks.
# Examples
# --------
#
# @example
#class { 'postfix_gmail':
#  username => "Someuser@gmail.com",
#  password => "XXXXXXXXXXXXXX",
#  myhostname => "puppet.server.com",
#  sslcert => "/etc/ssl/certs/ssl-cert-snakeoil.pem",
#  sslkey => "/etc/ssl/certs/ssl-cert-snakeoil.key",
#  cacert => "/etc/ssl/certs/ca-certificates.crt",
#  interfaces => "local",
#  destinations => ['puppet.server.com', 'puppet', 'puppetreply', 'localhost.localdomain', 'localhost','relaystuff.mail.com'],
#  networks => ['127.0.0.0/8','[::ffff:127.0.0.0]/104','[::1]/128'],
#  aliases => { 'root' => 'root@localhost.localdomain',
#               'postmaster' => 'root'},
#}
# Authors
# -------
#
# Christopher Miersma
# Anna Hegedus
#
# Copyright
# ---------
#
# Copyright 2021 Anna Hegedus
#
class postfix_gmail ($username = 'user@gmail.com', 
$password = 'password', 
$myhostname = 'localhost', 
$sslcert = '/etc/ssl/certs/ssl-cert-snakeoil.pem', 
$sslkey = '/etc/ssl/certs/ssl-cert-snakeoil.key', 
$cacert = '/etc/ssl/certs/ca-certificates.crt',
$interfaces = 'localhost', 
$destinations = ['localhost','localhost.localdomain','$myhostname'],
$networks = ['127.0.0.0/8','[::ffff:127.0.0.0]/104','[::1]/128'],
$aliases = { root => 'root@localhost.localdomain'})
{
  include postfix_gmail::packages
  include postfix_gmail::config
}
