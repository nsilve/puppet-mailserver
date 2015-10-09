class {'postfix':
    mailname	=> 'mail.puppet.nsilve.awmn',
}

include postfix::spamassassin
include postfix::clamav