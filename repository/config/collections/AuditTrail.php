<?php

use Norm\Schema\Stringz;
use Norm\Schema\Object;
use Norm\Schema\Text;
use Norm\Schema\Reference;

return array(
    'schema' => array(
        'user' => Reference::create('user')->to('User','$id','first_name')->set('list-column', true),
        'uri' => Stringz::create('uri')->set('list-column', true),
        'method' => Stringz::create('method')->set('list-column', true),
        'data' => Object::create('data')->set('list-column', true),
        'ip_address' => Stringz::create('ip_address')->set('list-column', true),
        'user_agent' => Text::create('user_agent')->set('list-column', true),
        'response' => Stringz::create('response')->set('list-column', true),
        'activity' => Stringz::create('activity')->filter('trim')->set('list-column', true),
    ),
);