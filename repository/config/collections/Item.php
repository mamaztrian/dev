<?php

use Norm\Schema\Stringz;

return array(
    'schema' => array(
        'biblio_id' => Stringz::create('biblio_id')->set('list-column', true),
        'call_number' => Stringz::create('call_number')->set('list-column', true),
        'item_code' => Stringz::create('item_code')->set('list-column', true),
    ),
);
