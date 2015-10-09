class postfix::install  {
    package { $postfix::package_name:
	ensure	=> present,
    }
    
    package { "$postfix::package_name-mysql":
	ensure	=> present,
    }

}