<?php

use Norm\Schema\NormString;
use App\Schema\SelectTwoReference;

return array(
    'schema' => array(
        'parent_id' => SelectTwoReference::create('parent_id')->to('DocumentType', '$id', 'name')->set('list-column', true),
        'name' => NormString::create('name')->set('list-column', true),
        'id_kategori' => NormString::create('id_kategori')->set('list-column', true),
    )
);
