# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#
class postfix_gmail ($username = 'user@gmail.com', 
$password = 'password', 
$myhostname = 'localhost', 
$sslcert = '/etc/ssl/certs/ssl-cert-snakeoil.pem', 
$sslkey = '/etc/ssl/certs/ssl-cert-snakeoil.key', 
$cacert = '/etc/ssl/certs/ca-certificates.crt',
$interfaces = 'localhost', 
$destinations = ['localhost','localhost.localdomain','$myhostname']), 
$networks = ['127.0.0.0/8','[::ffff:127.0.0.0]/104','[::1]/128'],
{
  include postfix_gmail::packages
  include postfix_gmail::config
}
