<?php

use Norm\Schema\NormString;
use Norm\Schema\Reference;
use Norm\Schema\DateTime;

return array(
    'schema' => array(
        'id_dokumen' => Reference::create('id_dokumen')->to('Document', '$id', 'judul')->set('list-column', true),
        'status_peraturan' => NormString::create('status_peraturan')->set('list-column', true),
        'id_dokumen_target' => Reference::create('id_dokumen_target')->to('Document', '$id', 'judul')->set('list-column', true),
        'catatan_status_peraturan' => NormString::create('catatan_status_peraturan')->set('list-column', true),
        'tanggal_perubahan' => DateTime::create('tanggal_perubahan')->set('list-column', true),
    )
);
