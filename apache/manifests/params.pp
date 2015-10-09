class apache::params {

    $apache_settings = {
	       #'user' 	=> 'test',
	       'host'	=> $::hostname,
	       }
    
    case $::osfamily {
	'Debian': {
	    $apache_package_name		= 'apache2'
	    $apache_service_name		= 'apache2'
	    $apache_config_dir			= '/etc/apache2'
	    $apache_service_dir			= '/etc/init.d'
	    $apache_home			= '/var/www'
	}
	default: {
	    fail("${::operatingsystem} not supported")
	}
    }
}