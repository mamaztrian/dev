<?php

namespace App\Observer;

use Norm\Norm;

class UserObserver
{
    public function saving($model)
    {
        if ($model['$id']) {
            if ($model['password'] == '') {
                $collection = Norm::factory('User')->findOne($model['$id']);
                $model['password'] = $collection['password'];
            }
        }
    }
}
