<?php

use Norm\Schema\Stringz;
use Norm\Schema\Reference;

return array(
    'schema' => array(
        'id_dokumen' => Reference::create('id_dokumen')->to('Document', '$id', 'judul')->set('list-column', true),
        'subyek' => Stringz::create('subyek')->set('list-column', true),
        'tipe_subyek' => Reference::create('tipe_subyek')->to('TipeKataKunci', '$id', 'name')->set('list-column', true),
        'jenis_subyek' => Stringz::create('jenis_subyek')->set('list-column', true),
    )
);
