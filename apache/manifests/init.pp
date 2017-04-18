class apache {

	exec { "apt-update":
		command => "/usr/bin/apt-get update"
	}

   	package { "apache2":
		ensure => "installed",
		allowcdrom => "true",
	}

	service { "apache2":
        	ensure => "running",
        	enable => "true",
        	require => Package["apache2"],
    	}

	exec { "userdir":
        	notify => Service["apache2"],
        	command => "/usr/sbin/a2enmod userdir",
        	require => Package["apache2"],
    	}

	file { "/home/xubuntu/public_html":
		ensure => "directory"
	}
	
	file { "/home/xubuntu/public_html/index.html":
		content => template("apache/index.html.erb"),
		require => File["/home/xubuntu/public_html"],
	}
}

