<?php

namespace App\Provider;

class LoginProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;
        $that = $this;

        $app->filter('auth.login.success', function ($user) use ($app) {
            $roles = $user['role'];
            $auth_uris = array();

            foreach ($roles as $key => $role) {
                $roleModel = \Norm::factory('Role')->findOne($role);
                $roleprevileges = \Norm::factory('RolePrevileges')->find(array('role' => $role));
                $uridata = array();

                foreach ($roleprevileges as $key => $value) {
                    $uridata[] = $value['rule'];
                }

                $uris[] = $uridata;
                $role_names[] = $roleModel['name'];
            }

            foreach ($uris as $key => $value) {
                $auth_uris = array_merge($auth_uris, $value);
            }

            $_SESSION['role_names'] = $role_names;
            $_SESSION['auth_uris'] = $auth_uris;

            return $user;
        });

        /* Allow user to access website homepage */
        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_bool($options)) {
                return $options;
            }

            if (empty($options['uri'])) {
                return true;
            }

            return $options;
        });

        /* Allow json */
        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_bool($options)) {
                return $options;
            }

            $segments = $app->request->getSegments();
            if (isset($segments[2])) {
                if ($segments[1] == 'admin' && ($segments[2] == 'document' || $segments[2] == 'data_lampiran' || $segments[2] == 'data_status' || $segments[2] == 'data_subyek' || $segments[2] == 'bidang_hukum' || $segments[2] == 'data_pengarang')) {
                    if (preg_match('/\/.*\.json/', $app->request->getPathInfo())) {
                        return true;
                    }
                }
            }

            return $options;
        });

        /* Allow page penelusuran */
        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_bool($options)) {
                return $options;
            }

            $segments = $app->request->getSegments();
            $segment = isset($segments[1]) ? $segments[1] : null;

            if ($segment == 'web' ||
                $segment == 'get_document_type_by_name' ||
                $segment == 'get_document'  ||
                $segment == 'get_existing_document_type' ||
                $segment == 'get_count_document' ||
                $segment == 'get_count_documents' ||
                $segment == 'get_main_document_type' ||
                $segment == 'get_nama_pengarang' ||
                $segment == 'get_existing_pengarang' ||
                $segment == 'get_existing_main_document_type' ||
                $segment == 'update_status_integrasi' ||
                $segment == 'update_status_integrasi_dokumen_type' ||
                $segment == 'update_status_integrasi_status' ||
                $segment == 'update_status_integrasi_pengarang' ||
                $segment == 'update_status_integrasi_lampiran' ||
                $segment == 'update_status_integrasi_bidang_hukum' ||
                $segment == 'update_status_integrasi_subyek'
            ) {
                return true;
            }

            return $options;
        });

        /* Check Access Each Role */
        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_bool($options)) {
                return $options;
            }

            if (preg_match('/\/.*\.json/', $app->request->getPathInfo())) {
                if (!empty($_SESSION['user'])) {
                    return true;
                }
            }

            $role = isset($_SESSION['role_names']) ? $_SESSION['role_names'] : null;

            if (!is_null($role)) {
                /* Allow user to access homepage */
                if (empty($options['uri'])) {
                    return true;
                }

                $uri = is_string($options)?$options:$options['uri'];
                $segment = explode('/', $uri);

                /* Allow this user for access all authorized uri */
                $auth_uris = $_SESSION['auth_uris'];

                foreach ($auth_uris as $auth_uri) {
                    /* Allow admin for access all URI */
                    if ($auth_uri == '*') {
                        return true;
                    }

                    // $auth_uri =  str_replace(':id', '[a-zA-Z0-9\.\:]+', $auth_uri);
                    $auth_uri =  str_replace('/', '\/', $auth_uri);
                    $auth_uri = "@^" . preg_replace('/(:id)+/', '([a-zA-Z0-9\-\_\.\?\:]+)', $auth_uri) . "$@D";

                    if (preg_match($auth_uri, $options['uri'])) {
                        return true;
                    }
                }

                return false;
            }

            return $options;
        });
    }
}
