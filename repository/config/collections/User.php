<?php

use Norm\Schema\NormString;
use App\Schema\Password;
use App\Schema\MultiReference;

return array(
    'observers' => array(
        '\\App\\Observer\\UserObserver'
    ),
    'schema' => array(
        'first_name' => NormString::create('first_name')->filter('trim|required')->set('list-column', true),
        'last_name' => NormString::create('last_name')->filter('trim|required')->set('list-column', true),
        'username' => NormString::create('username')->filter('trim|required|unique:User,username')->set('list-column', true),
        'normalized_username' => NormString::create('normalized_username')->filter('trim')->set('list-column', false)->set('hidden', true),
        'email' => NormString::create('email')->filter('trim|required|unique:User,email')->set('list-column', true),
        'password' => Password::create('password')->filter('trim|confirmed|salt'),
        'role' => MultiReference::create('role')->to('Role', '$id', 'name'),
    ),
);
