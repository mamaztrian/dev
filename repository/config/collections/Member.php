<?php

use Norm\Schema\Stringz;
use App\Schema\InputMask;
use App\Schema\Thumbnail;
use App\Schema\FileUpload;
use Norm\Schema\Reference;
use App\Schema\SelectTwoReference;
use App\Schema\MultiReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use App\Schema\SearchReference;
use Norm\Schema\NormDate;
use Norm\Schema\NormDateTime;
use Norm\Schema\NormString;
 

return array(
    'schema' => array(
        'member_image' => Thumbnail::create('member_image')->set('list-column', true)->set('bucket','storage'),
        'member_id' => NormString::create('member_id')->set('list-column', true),
        'member_name' => NormString::create('member_name')->set('list-column', true),
        'birth_date' => DatePicker::create('birth_date')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        'member_since_date' => DatePicker::create('member_since_date')->set('list-column', true),
        'register_date' => DatePicker::create('register_date')->setformatdate('dd-mm-yyyy')->set('list-column', true),
        'expire_date' => DatePicker::create('expire_date')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        'inst_name' => Stringz::create('inst_name', 'Institution')->set('list-column', true),
        'member_type_id' => SelectTwoReference::create('member_type_id', 'Membership Type')->to('MstMemberType', '$id', 'member_type_name')->set('list-column', true),
        'gender' => SelectTwoReference::create('gender', 'Sex')->to(array('1' => 'Male', '2' => 'Famale'))->set('list-column', true),
        'member_address' => Stringz::create('member_address', 'Address')->set('list-column', true),
        'postal_code' => Stringz::create('postal_code')->set('list-column', true),
        'member_mail_address' => Stringz::create('member_mail_address', 'Mail Address')->set('list-column', true),
        'phone_number' => NormString::create('phone_number')->set('list-column', true),
        'fax_number' => NormString::create('fax_number')->set('list-column', true),
        'personal_id_number' => NormString::create('personal_id_number')->set('list-column', true),
        'member_notes' => Stringz::create('member_notes')->set('list-column', true),
        'is_pending' => Reference::create('is_pending')->to(array('1' => 'Yes', '2' => 'No'))->set('list-column', true),
        'member_email' => Stringz::create('member_email')->set('list-column', true),
        'mpasswd' => NormString::create('mpasswd', 'my password')->set('list-column', true),
        'confirm_password' => NormString::create('confirm_password')->set('list-column', true),

        // 'is_new' => Stringz::create('is_new')->set('list-column', true),
        // 'pin' => Stringz::create('pin')->set('list-column', true),
        // 'last_login' => DatePicker::create('last_login')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        // 'input_date' => DatePicker::create('input_date')->setformatdate('dd/mm/yyyy')->set('list-column', true),
        // 'last_update' => DatePicker::create('last_update')->setformatdate('dd/mm/yyyy')->set('list-column', true),

        ),
);