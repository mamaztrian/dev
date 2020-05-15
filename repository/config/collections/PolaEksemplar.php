<?php

use Norm\Schema\NormString;

return array(
    'schema' => array(
        'prefix' => NormString::create('prefix')->set('list-column', true),
        'suffix' => NormString::create('suffix')->set('list-column', true),
        'length' => NormString::create('length')->set('list-column', true),
        'pattern' => NormString::create('pattern')->set('list-column', true),
    ),
);
