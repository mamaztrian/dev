<?php

use Norm\Schema\Stringz;
use Norm\Schema\Reference;

return array(
    'schema' => array(
        'id_dokumen' => Stringz::create('id_dokumen')->set('list-column', true),
        'nama_pengarang' => Reference::create('nama_pengarang')->to('Pengarang', '$id', 'name')->set('list-column', true),
        'tipe_pengarang' => Reference::create('tipe_pengarang')->to('TipePengarang', '$id', 'name')->set('list-column', true),
        'jenis_pengarang' => Reference::create('jenis_pengarang')->to('JenisPengarang', '$id', 'name')->set('list-column', true),
    )
);
