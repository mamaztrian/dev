<?php

/**
 * Bono App Configuration
 *
 * @category  PHP_Framework
 * @package   Bono
 * @author    Ganesha <reekoheek@gmail.com>
 * @copyright 2013 PT Sagara Xinix Solusitama
 * @license   https://raw.github.com/xinix-technology/bono/master/LICENSE MIT
 * @version   0.10.0
 * @link      http://xinix.co.id/products/bono
 */

return array(
    'application' => array(
        'title' => 'Bono Metronic',
        'subtitle' => 'One great application'
    ),
    'bono.timezone' => 'Asia/Jakarta',
    'bono.prettifyURL' => false,
    'bono.debug' => true,
    'bono.salt' => '123456789',
    'bono.theme' => array(
        'class' => 'Xinix\\Theme\\Jacket',
        'overwrite' => true,
        'htmlclass' => array('form-control'),
    ),
    'bono.providers' => array(
        'Norm\\Provider\\NormProvider' => array(
            'datasources' => array(
                // to use mongo
                // 'mongo' => array(
                //     'driver' => 'Norm\\Connection\\MongoConnection',
                //     'database' => 'bono',
                // ),

                // to use mysql
                'mysql' => array(
                    'driver'   => '\\Norm\\Connection\\PDOConnection',
                    'dialect'  => '\\Norm\\Dialect\\MySQLDialect',
                    'prefix'   => 'mysql',
                    'dbname'   => 'purbalin_dev',
                    'host'     => 'localhost',
                    'username' => 'purbalin_dev',
                    'password' => 'setiawan19',
                ),

                // 'database_jdih' => array(
                //     'driver'   => '\\Norm\\Connection\\PDOConnection',
                //     'dialect'  => '\\Norm\\Dialect\\MySQLDialect',
                //     'prefix'   => 'mysql',
                //     'dbname'   => 'jdihid_bphn_goid',
                //     'host'     => 'localhost',
                //     'username' => 'root',
                //     'password' => 'password',
                // )
            ),
            'collections' => array(
                'default' => array(
                    // The observer, more like a hook event
                    'observers' => array(
                        'Norm\\Observer\\Ownership',
                        'Norm\\Observer\\Timestampable',
                    ),

                    // Limit the entries that shown, then paginate them
                    'limit' => 10,
                ),

                // Resolver to find where the schemas config stored see in /config/collections folder
                'resolvers' => array(
                    'Norm\\Resolver\\CollectionResolver',
                ),
            ),
        ),
        'Bono\\Provider\\LanguageProvider' => null,
        'App\\Provider\\AppProvider'=> null,
        'App\\Provider\\MetronicProvider'=>array(
                'Upload_Directory' => dirname(__DIR__).'/www',// set directory for upload on application
                'bucket' => 'data'
        ),
        // uncomment below to enable auth
        'App\\Provider\\LoginProvider',
        'App\\Provider\\WebProvider',
    ),
    'bono.middlewares' => array(

        'Bono\\Middleware\\StaticPageMiddleware' => null,
        'Bono\\Middleware\\ControllerMiddleware' => array(
            'default' => 'App\\Controller\\AppController',
            'mapping' => array(
                /* Default */
                '/admin/user' => null,
                '/admin/previleges' => null,
                '/admin/sysparam' => null,
                '/admin/audit_trail' => null,
                '/admin/role' => '\\App\Controller\\RoleController',
                '/admin/test' => null,

                /* Master Data */
                '/admin/document_type' => null,
                '/admin/tempat_penetapan' => null,
                '/admin/bidang_hukum' => null,
                '/admin/penerbit' => null,
                '/admin/tipe_koleksi' => null,
                '/admin/gmd' => null,
                '/admin/klasifikasi' => null,
                '/admin/kala_terbit' => null,
                '/admin/pengarang' => null,
                '/admin/tipe_pengarang' => null,
                '/admin/jenis_pengarang' => null,
                '/admin/tipe_kata_kunci' => null,
                '/admin/jenis_peraturan' => null,
                '/admin/pola_eksemplar' => null,

                /* Modul Utama */
                '/admin/member' => 'App\\Controller\\MemberController',
                '/admin/document' => 'App\\Controller\\DocumentController',
                '/admin/document_configuration' => null,
                '/admin/mst_member_type' => null,
                '/admin/circulation' => 'App\\Controller\\CirculationController',
                '/admin/stock_opname' => 'App\\Controller\\StockOpnameController',
                '/admin/report' => null,
                '/admin/judul' => null,

                '/admin/doctype' => null,
                '/admin/data_lampiran' => null,
                '/admin/data_status' => null,
                '/admin/data_subyek' => null,
            ),
        ),
        // uncomment below to enable auth
        'Xinix\\BonoAuth\\Middleware\\AuthMiddleware' => array(
            // 'driver' => 'Xinix\\BonoAuth\\Driver\\NormAuth',
            'driver' => '\\App\\Auth\\Driver\\JdihAuth',
        ),
        'App\\Middleware\\MetronicNotificationMiddleware' => null,
        // 'App\\Middleware\\AuditTrailMiddleware' => null,
        'Bono\\Middleware\\SessionMiddleware' => null,

        'Bono\\Middleware\\ContentNegotiatorMiddleware' => array(
            'extensions' => array(
                'json' => 'application/json',
            ),
            'views' => array(
                'application/json' => 'Bono\\View\\JsonView',
            ),
        ),

    ),
);
