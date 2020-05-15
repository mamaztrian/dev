<?php

namespace App\Auth\Driver;

use Xinix\BonoAuth\Driver\NormAuth;

class JdihAuth extends NormAuth
{
    public function redirectBack()
    {
        \App::getInstance()->redirect(\URL::site('admin'));
    }
}
