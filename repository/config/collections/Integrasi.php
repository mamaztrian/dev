<?php

use Norm\Schema\NormString;

return array(
    'schema' => array(
        'domain' => NormString::create('domain')->set('list-column', true),
        'username' => NormString::create('username')->set('list-column', true),
        'password' => NormString::create('password')->set('list-column', true),
        'keterangan' => NormString::create('keterangan')->set('list-column', true),
    )
);
