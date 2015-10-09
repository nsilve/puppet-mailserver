class postfix::config {

#  ensure_resource ('user',$postfix::settings['user'],{ 'ensure'=> 'present' })

#  file { $postfix::config_dir:
#    ensure  => 'directory',
#  }


    $maincf 		= "$postfix::config_dir/main.cf"
    $mastercf 		= "$postfix::config_dir/master.cf"
    $mysqlcf_dir 	= "$postfix::config_dir/mysql"

    file {"$maincf.orig":
	ensure	=> file,
	source	=> "$maincf",
	replace	=> false,
    }

    file {"$mastercf.orig":
	ensure	=> file,
	source	=> "$mastercf",
	replace	=> false,
    }

    file {"$mysqlcf_dir":
	ensure	=> directory,
    }

    file {"/etc/mailname":
	ensure	=> file,
	content	=> $postfix::mailname,
    }

    ## sto mydestination tou main.cf den prepei na yparxei to domain gia to opoio theloume na dexomaste mail (alla mono sto virtual domains)
    
    augeas { "$maincf":
	context	=> "/files$maincf",
	changes	=> [
	    "set mailbox_command			'procmail -a \"\$EXTENSION\"'",
	    "set virtual_transport			dovecot",
	    "set dovecot_destination_recipient_limit	1",
	    "set virtual_mailbox_domains		mysql:/etc/postfix/mysql/virtual-domains.cf",
	    "set virtual_mailbox_maps			mysql:/etc/postfix/mysql/virtual-users.cf",
	    "set virtual_alias_maps			mysql:/etc/postfix/mysql/virtual-aliases.cf",
	    "set message_size_limit			30720000",
	],
    }

    augeas { "$mastercf":
	context	=> "/files$mastercf",
	changes	=> [
	    "set mailbox_command			'procmail -a \"\$EXTENSION\"'",
	    "set virtual_transport			dovecot",
	    "set dovecot_destination_recipient_limit	1",
	    "set virtual_mailbox_domains		mysql:/etc/postfix/mysql/virtual-domains.cf",
	    "set virtual_mailbox_maps			mysql:/etc/postfix/mysql/virtual-users.cf",
	    "set virtual_alias_maps			mysql:/etc/postfix/mysql/virtual-aliases.cf",
	    "set message_size_limit			30720000",
	],
    }
 
}