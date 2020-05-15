<?php

use Norm\Schema\NormString;
use App\Schema\SelectTwoReference;

return array(
    'schema' => array(
        'name' => NormString::create('name')->set('list-column', true),
        'parent' => SelectTwoReference::create('parent')->to('DocumentType', '$id', 'name')->set('list-column', true),
        'orders' => NormString::create('orders')->set('list-column', true),
    )
);
