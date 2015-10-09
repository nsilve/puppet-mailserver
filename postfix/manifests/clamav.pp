class postfix::clamav {
    package { 'clamsmtp':
        ensure  => present,
    }
}