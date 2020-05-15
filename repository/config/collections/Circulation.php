<?php

use Norm\Schema\Stringz;
use Norm\Schema\Reference;
use App\Schema\SelectTwoReference;
use App\Schema\MultiReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use App\Schema\SearchReference;
use Norm\Schema\NormDate;
use Norm\Schema\NormString;


return array(
    'schema' => array(
        'member_id' => SelectTwoReference::create('member_id')->to('Member', function($value){
            return $value['member_id'].' - '.$value['member_name'];
        })->set('list-column', true),
        // 'book_id' => SelectTwoReference::create('book_id')->to('Item', 'item_code')->set('list-column', true),
        'book_id' => SelectTwoReference::create('book_id')->to('Item', function($value){
            $book = \Norm::factory('Document')->findOne(array('$id' => $value['biblio_id']));

            return $value['item_code'].' - '.$book['judul'];
        })->set('list-column', true),
        'tanggal_pinjam' => DatePicker::create('tanggal_pinjam')->setformatdate('Y-m-d')->set('list-column', true),
        'tanggal_kembali' => NormString::create('tanggal_kembali')->set('list-column', true),
        'status' => Reference::create('status')->to(array(1=>'Pinjam', 2=>'Perpanjang', 3=>'Kembalikan'))->set('list-column', true),
        'denda' => NormString::create('denda')->set('list-column', false),
        ),
);