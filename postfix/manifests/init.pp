class postfix (
  ## Packages
  $package_name		= $postfix::params::postfix_package_name,

  ## Services
  $service_name		= $postfix::params::postfix_service_name,

  ## Dirs
  $config_dir		= $postfix::params::postfix_config_dir,
  $service_dir		= $postfix::params::postfix_service_dir,
  $home			= $postfix::params::postfix_home,

  ## External
  $mailname

) inherits postfix::params {

  # validate parameters here
#  validate_hash($settings)
#  validate_string($package_name)


  class { 'postfix::install': } 	->
  class { 'postfix::spamassassin': } 	->
  class { 'postfix::clamav': }		->
  class { 'postfix::config': }  	~>
  class { 'postfix::service': } 	->
  Class['postfix']


}