<?php

use Norm\Schema\Stringz;
use Norm\Schema\Reference;

return array(
    'schema' => array(
        'id_dokumen' => Reference::create('id_dokumen')->to('Document', '$id', 'judul')->set('list-column', true),
        'judul_lampiran' => Stringz::create('judul_lampiran')->set('list-column', true),
        'url_lampiran' => Stringz::create('url_lampiran')->set('list-column', true),
        'deskripsi_lampiran' => Stringz::create('deskripsi_lampiran')->set('list-column', true),
        'akses_lampiran' => Stringz::create('akses_lampiran')->set('list-column', true),
        'dokumen_lampiran' => Stringz::create('dokumen_lampiran')->set('list-column', true),
        'pembatasan_lampiran' => Stringz::create('pembatasan_lampiran')->set('list-column', true),
    )
);
