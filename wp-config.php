<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'purbalin_devjdih');

/** MySQL database username */
define('DB_USER', 'purbalin_devjdih');

/** MySQL database password */
define('DB_PASSWORD', 'setiawan19');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'X*sQ3VsfqFnheL?%+Vr3wOg9pF77P->#c+6g~f0>]VLg:vD`0!&}t$}ohIQ w$I4');
define('SECURE_AUTH_KEY',  'nI]QREO#uMeWoUv:qo<roI-_FP2T&EAfWr$}arTg%Wu@rXsA_&b%mQ9tH,%O;M~U');
define('LOGGED_IN_KEY',    'nA_efAF@,I9_6+;:/0=4n`6Q[_#z=5^fnr~3A-~ F[l#azh yv<0&J8t8e!$mU+B');
define('NONCE_KEY',        '~ont}@=GkBg+Y(CSyv=btw{(WPtVai[MMb^2QIqBc{OP2uHQyV$By %T@raWs0yW');
define('AUTH_SALT',        'xN5OsMqZtl*vYWCR3o v@^eF3MZe!}9L*a<iQyTL[^9.V3whf;qMDv<:*BEc^D2b');
define('SECURE_AUTH_SALT', 'guS;g.*Efbv!A3C_r8S]@!#T(AKsxBM9E!Z!L:SI4INiD.4D_vD9I({`~7T3gcdM');
define('LOGGED_IN_SALT',   'XQJ.K~(Nak8j;(UB/uXn]7XY2rKycM_)YqnP2qL#59+`)@X i$#Ro0nr#54KZBK.');
define('NONCE_SALT',       '!>nd,+IJ6K{Jo5:tHbrzy+4?,D Q?%!Lu^v;9^a,`Jye0+mxt+G}KZ7Kmv&UYSlb');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
