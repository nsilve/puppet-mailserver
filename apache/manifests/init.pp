class apache (
  ## Packages
  $package_name		= $apache::params::apache_package_name,

  ## Services
  $service_name		= $apache::params::apache_service_name,

  ## Dirs
  $config_dir		= $apache::params::apache_config_dir,
  $service_dir		= $apache::params::apache_service_dir,
  $home			= $apache::params::apache_home,


) inherits apache::params {

  # validate parameters here
#  validate_hash($settings)
#  validate_string($package_name)

  class { 'apache::install': } ->
  class { 'apache::config': } ~>
  class { 'apache::service': } ->
  Class['apache']
}