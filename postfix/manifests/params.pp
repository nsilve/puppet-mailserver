class postfix::params {

    $postfix_settings = {
	       #'user' 	=> 'test',
	       'host'	=> $::hostname,
	       }
    
    case $::osfamily {
	'Debian': {
	    $postfix_package_name		= 'postfix'
	    $postfix_service_name		= 'postfix'
	    $postfix_config_dir			= '/etc/postfix'
	    $postfix_service_dir		= '/etc/init.d'
	    $postfix_home			= '/etc/postfix'
	}
	default: {
	    fail("${::operatingsystem} not supported")
	}
    }
}