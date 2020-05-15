<?php

use Norm\Schema\NormText;

return array(
    'schema' => array(
        'nama' => NormText::create('nama','Nama Instansi')->set('list-column', true),
    )
);
