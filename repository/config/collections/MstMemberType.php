<?php

use App\Schema\SelectTwoReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use Norm\Schema\NormString;
 

return array(
    'schema' => array(
        'member_type_name' => NormString::create('member_type_name')->set('list-column', true),
        'loan_limit' => NormString::create('loan_limit')->set('list-column', true),
        'loan_periode' => NormString::create('loan_periode')->set('list-column', true),
        'enable_reserve' => NormString::create('enable_reserve')->set('list-column', true),
        // 'member_type_id' => NormString::create('member_type_id')->set('list-column', true),
        'reserve_limit' => NormString::create('reserve_limit')->set('list-column', true),
        'member_periode' => NormString::create('member_periode')->set('list-column', true),
        'reborrow_limit' => NormString::create('reborrow_limit')->set('list-column', true),
        'fine_each_day' => NormString::create('fine_each_day')->set('list-column', true),
        'grace_periode' => NormString::create('grace_periode')->set('list-column', true),
        'input_date' => DatePicker::create('input_date')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        'last_update' => DatePicker::create('last_update')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        ),
);