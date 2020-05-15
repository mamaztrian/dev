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
        'nama_inventarisasi' => NormString::create('nama_inventarisasi')->set('list-column', true),
        'gmd' => SelectTwoReference::create('gmd')->to('Gmd', 'name')->set('list-column', true),
        'type_koleksi' => SelectTwoReference::create('type_koleksi')->to(array('1' => 'semua'))->set('list-column', true),
        'lokasi' => SelectTwoReference::create('lokasi')->to(array('1' => 'semua'))->set('list-column', true),
        'lokasi_rak' => NormString::create('lokasi_rak')->set('list-column', true),
        'klasifikasi' => NormString::create('klasifikasi')->set('list-column', true),
        'stok_status' => NormString::create('stok_status')->set('list-column', true),
        'tanggal_dibuat' => DatePicker::create('tanggal_dibuat')->setformatdate('dd-mm-yyyy H:i:s')->set('list-column', true),
        'tanggal_selesai' => DatePicker::create('tanggal_selesai')->setformatdate('dd-mm-yyyy H:i:s')->set('list-column', true),

        ),
);