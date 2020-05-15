<?php

namespace Xinix\BonoAuth\Middleware;

use Norm\Filter\Filter;
use Xinix\BonoAuth\Exception\AuthException;

class AuthMiddleware extends \Slim\Middleware
{
    protected $driver;

    public function call()
    {
        if ($this->app->config('bono.cli')) {
            return $this->next->call();
        }

        $app = $this->app;
        $request = $app->request;
        $response = $app->response;
        $that = $this;

        $defaultOptions = array(
            'unauthorizedUri' => '/unauthorized'
        );

        if (is_array($this->options)) {
            $this->options = array_merge($defaultOptions, $this->options);
        } else {
            $this->options = $defaultOptions;
        }

        if (isset($this->options['driver'])) {
            $Clazz = $this->options['driver'];
        } elseif (isset($this->options['class'])) {
            $Clazz = $this->options['class'];
        } else {
            throw new \Exception('No auth driver specified.');
        }

        $app->auth = $driver = $this->driver = new $Clazz($this);

        if (!$driver instanceof \Xinix\BonoAuth\Driver\Auth) {
            throw new \Exception('Auth driver should be instance of Xinix\\BonoAuth\\Driver\\Auth.');
        }

        // authentication needs SessionMiddleware
        if (!$app->has('Bono\\Middleware\\SessionMiddleware')) {
            throw new \Exception('Authentication need Bono\\Middleware\\SessionMiddleware.');
        }


        // theme may get templates from bono-auth
        $f = explode('/src/', __FILE__);
        $f = $f[0];
        $app->theme->addBaseDirectory($f);


        $app->filter('auth.html.link', function ($l) use ($driver) {
            if ($driver->authorize($l['uri'])) {
                return '<a href="'.\URL::site($l['uri']).'">'.$l['label'].'</a>';
            }
        });

        $app->filter('auth.allowed', function ($l) use ($driver) {
            return $driver->authorize($l);
        });

        // TODO revisit notification.error write should be trapped from
        // notificationmiddleware automatically
        $app->get('/unauthorized', function () use ($app, $response, $driver) {
            if (!empty($_GET['error'])) {
                h('notification.error', new AuthException($_GET['error']));
            } else {
                h('notification.error', 'Unauthorized!');
            }
            // $app->flashNow('error', '<p>Unauthorized!</p>');

            $response->setStatus(401);
            $response->template('unauthorized');
        });

        $app->get('/login', function () use ($app, $response, $driver) {
            $response->template('login');

            try {
                $loginUser = $driver->authenticate();

                if ($loginUser) {
                    $driver->redirectBack();
                }
            } catch (\Slim\Exception\Stop $e) {
                throw $e;
            } catch (\Exception $e) {
                h('notification.error', $e);
                // $app->flashNow('error', ''.$e);
            }

        });


        $app->post('/login', function () use ($app, $driver) {
            $app->response->template('login');

            $entry = $body = $app->request->getBody();
            try {
                $loginUser = $driver->authenticate($body);

                if (is_null($loginUser)) {
                    throw new \Exception('Username or password not match');
                }

                if (f('auth.login.success', $loginUser)) {
                    $driver->redirectBack();
                }

                $entry = $loginUser;
            } catch (\Slim\Exception\Stop $e) {
                throw $e;
            } catch (\Exception $e) {
                $app->response->setStatus(401);
                h('notification.error', $e);
            }

            $app->response->data('entry', $entry);

        });

        $app->get('/logout', function () use ($app, $driver) {
            h('notification.info', 'Good bye.');
            $driver->revoke();
        });

        $app->get('/passwd', function () use ($app) {
            $app->response->template('passwd');
        });

        $app->post('/passwd', function () use ($app) {
            Filter::register('checkPassword', function ($value, $data) {
                if ($_SESSION['user']['password'].'' === $value) {
                    return $value;
                } else {
                    throw new \Exception('Old password not valid');
                }
            });

            $filter = Filter::create(array(
                'old' => 'trim|required|salt|checkPassword',
                'new' => 'trim|required|confirmed|salt',
            ));

            $app->response->template('passwd');

            $data = $app->request->post();
            try {
                $data = $filter->run($data);

                $user = \Norm::factory('User')->findOne($_SESSION['user']['$id']);

                $user['password'] = $data['new_confirmation'];
                $user['password_confirmation'] = $data['new_confirmation'];
                $user->save();

                $_SESSION['user'] = $user->toArray();

                if (f('auth.passwd.success', $user)) {
                    h('notification.info', 'Your password is changed.');
                }
            } catch (\Slim\Exception\Stop $e) {
                // noop
            } catch (\Exception $e) {
                h('notification.error', $e);
            }

            $app->response->data('entry', $data);

        });

        $app->filter('auth.isAuthorized', function ($options) use ($app) {
            return $app->auth->authorize($options);
        });

        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_array($options) && isset($options['uri'])) {
                $uri = $options['uri'];
            } else {
                $uri = $options;
            }

            switch ($uri) {
                case '/login':
                case '/logout':
                case '/unauthorized':
                    return true;
            }

            return $options;
        }, 0);

        if ($driver->authorize($app->request->getResourceUri())) {
            return $this->next->call();
        } else {
            $response->setStatus(401);
            $response->template('unauthorized');

            // $response->redirect(\URL::create($this->options['unauthorizedUri'], array(
            //     '!continue' => $driver->getRedirectUri(),
            // )));
        }

    }
}
