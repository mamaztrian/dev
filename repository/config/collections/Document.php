<?php

use Norm\Schema\NormString;
use Norm\Schema\Text;
use Norm\Schema\Integer;
use Norm\Schema\Reference;
use App\Schema\SelectTwoReference;
use App\Schema\DatePicker;
use App\Schema\FileUpload;

return array(
    'observers' => array(
        'App\\Observer\\DocumentObserver' => null
    ),
    'schema' => array(
        'jenis_peraturan' => SelectTwoReference::create('jenis_peraturan', 'Jenis Peraturan / Putusan')->to('DocumentType', '$id', 'name')->set('list-column', true),
        'tahun_terbit' => NormString::create('tahun_terbit')->set('list-column', true),
        'nomor_peraturan' => NormString::create('nomor_peraturan')->set('list-column', true),
        'judul' => NormString::create('judul')->set('list-column', true),
        'tipe_dokumen' => SelectTwoReference::create('tipe_dokumen')->to('DocumentType', '$id', 'name')->by(array('parent_id' => 0))->set('list-column', false),
        'bidang_hukum' => SelectTwoReference::create('bidang_hukum')->to('BidangHukum', '$id', 'name')->set('list-column', false),
        'status_terakhir' => NormString::create('status_terakhir')->set('list-column', true),
        'nomor_panggil' => NormString::create('nomor_panggil')->set('list-column', false),
        'singkatan_bentuk' => NormString::create('singkatan_bentuk', 'Singkatan Jenis/Bentuk Peraturan/Putusan')->set('list-column', false),
        'edisi' => NormString::create('edisi', 'Cetakan/Edisi')->set('list-column', false),
        'tempat_terbit' => SelectTwoReference::create('tempat_terbit')->to('TempatPenetapan', '$id', 'name')->set('list-column', false),
        'penerbit' => SelectTwoReference::create('penerbit')->to('Penerbit', '$id', 'name')->set('list-column', false),
        'tanggal_penetapan' => DatePicker::create('tanggal_penetapan', 'Tanggal Penetapan / Dibacakan')->set('list-column', true),
        'deskripsi_fisik' => NormString::create('deskripsi_fisik')->set('list-column', false),
        'sumber' => NormString::create('sumber')->set('list-column', false),
        'isbn' => NormString::create('isbn')->set('list-column', false),
        'bahasa' => SelectTwoReference::create('bahasa')->to(array(
            1 => 'Indonesia',
            2 => 'Inggris',
        ))->set('list-column', false),
        'nomor_induk_buku' => NormString::create('nomor_induk_buku')->set('list-column', false),

        /* Khusus monografi hukum */
        'tanggal_dibacakan' => DatePicker::create('tanggal_dibacakan')->set('list-column', false),
        'pernyataan_tanggung_jawab' => NormString::create('pernyataan_tanggung_jawab')->set('list-column', false),
        'info_detil_spesifik' => Text::create('info_detil_spesifik')->set('list-column', false),
        'pola_nomor_eksemplar' => SelectTwoReference::create('pola_nomor_eksemplar')->to('PolaEksemplar', '$id', 'pattern')->set('list-column', false),
        'jumlah_eksemplar' => Integer::create('jumlah_eksemplar')->set('list-column', false),
        'nomor_eksemplar_sampai' => Integer::create('nomor_eksemplar_sampai')->set('list-column', false),
        'tipe_koleksi_nomor_eksemplar' => SelectTwoReference::create('tipe_koleksi_nomor_eksemplar')->to('TipeKoleksi', '$id', 'name')->set('list-column', false),
        'gmd' => SelectTwoReference::create('gmd')->to('Gmd', '$id', 'name')->set('list-column', false),
        'kala_terbit' => SelectTwoReference::create('kala_terbit')->to('KalaTerbit', '$id', 'name')->set('list-column', false),
        'judul_seri' => NormString::create('judul_seri')->set('list-column', false),
        'klasifikasi' => NormString::create('klasifikasi')->set('list-column', false),
        // 'klasifikasi' => SelectTwoReference::create('klasifikasi')->to('Klasifikasi', '$id', 'name')->set('list-column', false),
        'abstrak' => Text::create('abstrak')->set('list-column', false),
        'gambar_sampul' => FileUpload::create('gambar_sampul')->set('bucket', 'gambar_sampul')->set('list-column', false),
        'sembunyikan_di_opac' => SelectTwoReference::create('sembunyikan_di_opac')->to(array(
            1 => 'Yes',
            2 => 'No',
        ))->set('list-column', false),
        'promosikan_ke_beranda' => SelectTwoReference::create('promosikan_ke_beranda')->to(array(
            1 => 'Yes',
            2 => 'No',
        ))->set('list-column', false),
        'label' => NormString::create('label')->set('list-column', false), //FIXME: Bentuk data masih belum diketahui

        '_created_by' => Reference::create('_created_by', 'Pembuat')->to('User', '$id', 'username')->set('list-column', true)->set('transient', true),
        '_created_time' => DatePicker::create('_created_time', 'Tanggal Pembuatan')->set('list-column', true)->set('transient', true)->setformatdate('dd F yy'),
        '_updated_by' => Reference::create('_updated_by', 'Pengubah')->to('User', '$id', 'username')->set('list-column', true)->set('transient', true),
        '_updated_time' => DatePicker::create('_updated_time', 'Tanggal Pengubahan')->set('list-column', true)->set('transient', true)->setformatdate('dd F yy'),
    )
);
