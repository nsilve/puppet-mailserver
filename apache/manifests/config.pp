class apache::config {

#  ensure_resource ('user',$apache::settings['user'],{ 'ensure'=> 'present' })

#  file { $apache::config_dir:
#    ensure  => 'directory',
#  }


}