<?php

use Norm\Schema\Stringz;

return array(
	'schema' => array(
		'orders' => Stringz::create('orders', 'Order')->set('list-column', true),
		'name' => Stringz::create('name')->set('list-column', true),
	)
);
