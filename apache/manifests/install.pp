class apache::install  {
    package { $apache::package_name:
	ensure	=> present,
    }
}