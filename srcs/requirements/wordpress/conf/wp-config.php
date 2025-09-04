<?php

/* MySQL settings */
define( 'DB_NAME',     getenv('DB_NAME') );
define( 'DB_USER',     getenv('DB_USER') );
define( 'DB_PASSWORD', getenv('DB_PASS') );
define( 'DB_HOST',     getenv('DB_HOST') );
define( 'DB_CHARSET',  'utf8mb4' );

/* MySQL database table prefix. */
$table_prefix = 'wp_';

/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'e|B<i>j-IEWSyD)k3kS+^^+Yi(8);wvdrU])]1z~Dmc]o)}J&a0anxSKTg/`=>/[');
define('SECURE_AUTH_KEY',  '>C,w[S1?-08((?(>jS*e=%@^BJ<-R~{mDl>SK/KeqfG?B(|tMTT6~@O xv6~d[DR');
define('LOGGED_IN_KEY',    '-y8NcV)7/0W>|#%iVo,cwrKp.4,4L[3J._U5mL(~lX]ru6l:ckF*H-m%;K[d*SJS');
define('NONCE_KEY',        '<{)zujG[,8Sc8y&,q~b,c?cIa8PW3$35Q`pR$?/E7}WQKz0qf1|Uq?k;]+&?w-e}');
define('AUTH_SALT',        'gT{_-Py.S<g6rN%5Y,vg-#<zJhNNc%qn!QbP[&qKu,]j|DS;uKna)`Q;^@ iE#0L');
define('SECURE_AUTH_SALT', 'Dj6/h.<(_]qK||dTydG1j5fJS[]+|92v^k7(r|WJld[yWQ`s6<p6-YYHahb#5oK9');
define('LOGGED_IN_SALT',   'OvZ-_NqBm]DZng@u^}m9d;cbL3|Fs?)W nIZV7Rh|h=|(SR13de%<Fwx5riO?1AA');
define('NONCE_SALT',       'pM0O6GK=h-W-8$`^+DMf]J|@N{&m!p3]SVp@|{,CDB=CTduv:dpPK-EAXxt+H/@0');

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');