# Definition: ipa::serverinstall
#
# Setup for Enterprise Linux 

# Config classes
# generall master
# generall client
# dhcp
# NIS
# freeradius
# puppet master
# samba

## This is the Vagrant init.pp file

node default {
  $varclients = {
    'somenode' => {
      'fileset'  => 'Basic:noHome',
      'schedule' => 'Hourly',
    },
    'node2' => {
      'fileset'  => 'Basic:noHome',
      'schedule' => 'Hourly',
    }
  }
 Postgresql_psql {
   cwd => '/',
 }
 include postgresql::client, postgresql::server
 # include mysql::server, mysql::server::account_security
 class { 'bacula':
   is_storage        => true,
   is_director       => true,
   is_client         => true,
   manage_console    => true,
   manage_db         => true,
   db_backend        => 'postgresql',
   db_host           => 'localhost',
   db_user           => 'bacula',
   db_password       => 'bacula',
   db_database       => 'bacula',
   db_port           => '5432',
   director_password => 'xxxxxxxxx',
   console_password  => 'xxxxxxxxx',
   director_server   => 'bacula.domain.com',
   mail_to           => 'bacula-admin@domain.com',
   storage_server    => 'bacula.domain.com',
   clients           => $varclients,
 }
}
