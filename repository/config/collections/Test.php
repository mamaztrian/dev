<?php

use Norm\Schema\NormString;
use Norm\Schema\Reference;
use Norm\Schema\NormDate;
use Norm\Schema\NormDateTime;
use App\Schema\InputMask;
use App\Schema\Thumbnail;
use App\Schema\FileUpload;
use App\Schema\SelectTwoReference;
use App\Schema\MultiReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use App\Schema\SearchReference;
use App\Schema\Dropdown;

return array(
    'schema' => array(
        // 'test' => Dropdown::create('test')->to(array('a'=>'testing1','b'=> 'test2')),
        // 'test' => Thumbnail::create('photo', 'Gambar')->set('list-column', true)->set('bucket', 'storage'),
        // 'test' => NormString::create('nama')->set('list-column', true),
        // 'test' => InputMask::create('ktp')->set('list-column', true)->set_mask('99-9999-99_99.999'),
        // 'test' => FileUpload::create('file')->set('list-column', true)->set('bucket', 'storage1'),
        // 'test' => Reference::create('dropdown')->to(array('a'=>'testing1','b'=> 'test2')),
        // 'test' => SelectTwoReference::create('select')->to(array('a'=>'testing1','b'=> 'test2')),
        // 'test' => MultiReference::create('role')->to('Role'),
        // 'test' => SearchReference::create('user')->to('User', 'first_name')->set('field', array('email', 'last_name')),
        // 'test' => DatePicker::create('testdate')->setformatdate('dd-mm-yyyy'),
        // 'test' => NormDate::create('testdate3'),
        // 'test' => NormDateTime::create('testdate4'),
        // 'test' => SysparamReference::create('sysparam')->setGroups('test1'),
    ),
);
