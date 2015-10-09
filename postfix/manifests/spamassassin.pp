class postfix::spamassassin {

    package { 'spamassassin':
        ensure  => present,
    }

    package { 'spamc':
        ensure  => present,
    }


#    file{postifx////   notify => Service["$postfix::service_name"]
}