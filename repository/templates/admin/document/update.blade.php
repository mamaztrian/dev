@extends('layout')

<?php use ROH\Util\Inflector; ?>
<?php use Norm\Schema\Reference; ?>

@section('title')
    {{ l('{0}', Inflector::humanize(f('controller')->getClass())) . ' Update' }}
@stop

@section('page.breadcumb.section')
    <li>
        <a href="{{ f('controller.url')}}" >{{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</a>
        <i class="fa fa-circle"></i>
    </li>
    <li>
        <span>Update</span>
    </li>
@stop

@section('fields')

    <div class="row">
        <div class="col-md-12">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        @section('caption')
                        <i class="icon-user font-green"></i>
                        <span class="caption-subject font-green bold uppercase"> Update {{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</span>
                        @show
                        <!-- <span class="caption-helper">demo form...</span> -->
                    </div>

                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form method="post" id="updateform" class="read form-document" enctype="multipart/form-data">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-data-utama" data-toggle="tab" aria-expanded="true"> Data Utama </a>
                            </li>
                            <li class="">
                                <a href="#tab-pengarang" data-toggle="tab" aria-expanded="false"> Pengarang </a>
                            </li>
                            <li class="">
                                <a href="#tab-subyek" data-toggle="tab" aria-expanded="false"> Subyek </a>
                            </li>
                            <li class="">
                                <a href="#tab-lampiran-berkas" data-toggle="tab" aria-expanded="false"> Lampiran Berkas </a>
                            </li>
                            <li class="">
                                <a href="#tab-status-peraturan" data-toggle="tab" aria-expanded="false"> Status Peraturan </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tab-data-utama">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="portlet box blue ">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-gift"></i>
                                                    </div>
                                                    <div class="tools">
                                                        <a href="" class="collapse"> </a>
                                                    </div>
                                                </div>

                                                <div class="portlet-body">
                                                    <div class="row">
                                                        <div class="col-md-6 tipe_dokumen">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Tipe Dokumen</label>
                                                                {{ $entry->format('tipe_dokumen', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 jenis_peraturan" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-jenis">Jenis / Bentuk Monografi Hukum, Peraturan/Putusan</label>
                                                                <select name="jenis_peraturan" data-id="{{ $entry['jenis_peraturan'] }}" class="lookup-document-type" style="width: 100%;">
                                                                    <option value="">Silahkan Pilih</option>
                                                                </select>

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 bidang_hukum" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Bidang Hukum</label>
                                                                {{ $entry->format('bidang_hukum', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 judul" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Judul</label>
                                                                {{ $entry->format('judul', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_peraturan" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-nomor">Nomor Peraturan / Putusan</label>
                                                                {{ $entry->format('nomor_peraturan', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_panggil" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Nomor Panggil</label>
                                                                {{ $entry->format('nomor_panggil', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 singkatan_bentuk" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-singkatan">Singkatan Jenis/Bentuk Peraturan/Putusan</label>
                                                                {{ $entry->format('singkatan_bentuk', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 edisi" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Edisi</label>
                                                                {{ $entry->format('edisi', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tempat_terbit" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-tempat">Tempat Terbit</label>
                                                                {{ $entry->format('tempat_terbit', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 penerbit" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Penerbit</label>
                                                                {{ $entry->format('penerbit', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tanggal_penetapan" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-tanggal">Tanggal Penetapan</label>
                                                                {{ $entry->format('tanggal_penetapan', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 deskripsi_fisik" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Deskripsi Fisik</label>
                                                                {{ $entry->format('deskripsi_fisik', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 sumber" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Sumber</label>
                                                                {{ $entry->format('sumber', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 isbn" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">ISBN</label>
                                                                {{ $entry->format('isbn', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 bahasa" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Bahasa</label>
                                                                {{ $entry->format('bahasa', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_induk_buku" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Nomor Induk Buku</label>
                                                                {{ $entry->format('nomor_induk_buku', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tahun_terbit" style="display: none;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Tahun Terbit</label>
                                                                {{ $entry->format('tahun_terbit', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        {{-- Khusus monografi mulai dari sini --}}
                                        <div class="col-md-12 khusus-monografi" style="display: none;">
                                            <div class="portlet box blue ">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-gift"></i>
                                                    </div>
                                                    <div class="tools">
                                                        <a href="" class="collapse"> </a>
                                                    </div>
                                                </div>

                                                <div class="portlet-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Tipe Koleksi Nomor Eksemplar</label>
                                                                {{ $entry->format('tipe_koleksi_nomor_eksemplar', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Pola Nomor Eksemplar</label>
                                                                {{ $entry->format('pola_nomor_eksemplar', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Jumlah Eksemplar</label>
                                                                {{ $entry->format('jumlah_eksemplar', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 khusus-monografi" style="display: none;">
                                            <div class="portlet box blue ">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-gift"></i>
                                                    </div>
                                                    <div class="tools">
                                                        <a href="" class="collapse"> </a>
                                                    </div>
                                                </div>

                                                <div class="portlet-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Kala Terbit</label>
                                                                {{ $entry->format('kala_terbit', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Tanggal Dibacakan</label>
                                                                {{ $entry->format('tanggal_dibacakan', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>



                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Pernyataan Tanggung Jawab</label>
                                                                {{ $entry->format('pernyataan_tanggung_jawab', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">GMD</label>
                                                                {{ $entry->format('gmd', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Judul Seri</label>
                                                                {{ $entry->format('judul_seri', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Klasifikasi</label>
                                                                {{ $entry->format('klasifikasi', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Label</label>
                                                                {{ $entry->format('label', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Info Detil Spesifik</label>
                                                                {{ $entry->format('info_detil_spesifik', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Abstrak / Catatan</label>
                                                                {{ $entry->format('abstrak', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Gambar Sampul</label>
                                                                {{ $entry->format('gambar_sampul', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 khusus-monografi" style="display: none;">
                                            <div class="portlet box blue ">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-gift"></i>
                                                    </div>
                                                    <div class="tools">
                                                        <a href="" class="collapse"> </a>
                                                    </div>
                                                </div>

                                                <div class="portlet-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Sembunyikan Di OPAC</label>
                                                                {{ $entry->format('sembunyikan_di_opac', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Promosikan Ke Beranda</label>
                                                                {{ $entry->format('promosikan_ke_beranda', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        {{-- Khusus monografi selesai sampai disini --}}
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-pengarang">
                                {{-- Form Input --}}
                                <div class="modal fade template" id="modal-form-pengarang" role="basic" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Data Pengarang</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h4>Nama Pengarang</h4>
                                                        <select class="select2reference select22 form-control nama-pengarang">
                                                            <option></option>
                                                            @foreach($data_pengarang as $pengarang)
                                                                <option value="{{ $pengarang['$id'] }}">{{ $pengarang['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Tipe Pengarang</h4>
                                                        <select class="select2reference select2 form-control tipe-pengarang">
                                                            <option></option>
                                                            @foreach($data_tipe_pengarang as $tipe_pengarang)
                                                                <option value="{{ $tipe_pengarang['$id'] }}">{{ $tipe_pengarang['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Jenis Pengarang</h4>
                                                        <select class="select2reference select2 form-control jenis-pengarang">
                                                            <option></option>
                                                            @foreach($data_jenis_pengarang as $jenis_pengarang)
                                                                <option value="{{ $jenis_pengarang['$id'] }}">{{ $jenis_pengarang['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-outline dark">Cancel</button>
                                                <button type="button" class="btn green add-pengarang">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Pengarang</span>
                                        </div>
                                        <div class="actions">
                                            <a id="tambah-pengarang" class="btn btn-default" data-toggle="modal" href="#modal-form-pengarang">
                                                <i class="icon-plus"></i> Tambah
                                            </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table id="table-pengarang" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th> Nama Pengarang </th>
                                                        <th> Tipe Pengarang </th>
                                                        <th> Jenis Pengarang </th>
                                                        <th> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-pengarang">
                                                    @if($existing_pengarang->count() > 0)
                                                        @foreach($existing_pengarang as $key => $xpengarang)
                                                            <tr class="row-data-pengarang">
                                                                <td class="nama-pengarang">
                                                                    {{ Reference::create('nama_pengarang')->to('Pengarang', '$id', 'name')->format('plain', $xpengarang['nama_pengarang']) }}
                                                                    <input type="hidden" name="data_pengarang[{{ $key }}][nama_pengarang]" value="{{ $xpengarang['nama_pengarang'] }}">
                                                                </td>
                                                                <td class="tipe-pengarang">
                                                                    {{ Reference::create('tipe_pengarang')->to('TipePengarang', '$id', 'name')->format('plain', $xpengarang['tipe_pengarang']) }}
                                                                    <input type="hidden" name="data_pengarang[{{ $key }}][tipe_pengarang]" value="{{ $xpengarang['tipe_pengarang'] }}">
                                                                </td>
                                                                <td class="jenis-pengarang">
                                                                    {{ Reference::create('jenis_pengarang')->to('JenisPengarang', '$id', 'name')->format('plain', $xpengarang['jenis_pengarang']) }}
                                                                    <input type="hidden" name="data_pengarang[{{ $key }}][jenis_pengarang]" value="{{ $xpengarang['jenis_pengarang'] }}">
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default delete-pengarang">Delete</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-pengarang">
                                                            <td colspan="4"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-subyek">
                                {{-- Form Input --}}
                                <div class="modal fade template" id="modal-form-subyek" role="basic" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Data Subyek</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h4>Kata Kunci</h4>
                                                        <select class="select2reference select22 form-control subyek">
                                                            <option value=""></option>
                                                            @foreach($data_subyek as $subyek)
                                                                <option value="{{ $subyek['subyek'] }}">{{ $subyek['subyek'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Tipe Kata Kunci</h4>
                                                        <select class="select2reference select2 form-control tipe-subyek">
                                                            <option></option>
                                                            @foreach($data_tipe_kata_kunci as $tipe_kata_kunci)
                                                                <option value="{{ $tipe_kata_kunci['$id'] }}">{{ $tipe_kata_kunci['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Jenis Kata Kunci</h4>
                                                        <select class="select2reference select2 form-control jenis-subyek">
                                                            <option></option>
                                                            <option value="primary">Primary</option>
                                                            <option value="additional">Additional</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-outline dark">Cancel</button>
                                                <button type="button" class="btn green add-subyek">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Kata Kunci</span>
                                        </div>
                                        <div class="actions">
                                            <a id="tambah-subyek" class="btn  btn-default" data-toggle="modal" href="#modal-form-subyek">
                                                <i class="icon-plus"></i> Tambah
                                            </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th> Kata Kunci </th>
                                                        <th> Tipe Kata Kunci </th>
                                                        <th> Jenis Kata Kunci </th>
                                                        <th> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-subyek">
                                                    @if($existing_subyek->count() > 0)
                                                        @foreach($existing_subyek as $key => $xsubyek)
                                                            <tr class="row-data-subyek">
                                                                <td class="subyek">
                                                                    {{ $xsubyek['subyek'] }}
                                                                    <input type="hidden" name="data_subyek[{{ $key }}][subyek]" value="{{ $xsubyek['subyek'] }}">
                                                                </td>
                                                                <td class="tipe-subyek">
                                                                    {{ Reference::create('tipe_subyek')->to('TipeKataKunci', '$id', 'name')->format('plain', $xsubyek['tipe_subyek']) }}
                                                                    <input type="hidden" name="data_subyek[{{ $key }}][tipe_subyek]" value="{{ $xsubyek['tipe_subyek'] }}">
                                                                </td>
                                                                <td class="jenis-subyek">
                                                                    {{ ucfirst($xsubyek['jenis_subyek']) }}
                                                                    <input type="hidden" name="data_subyek[{{ $key }}][jenis_subyek]" value="{{ $xsubyek['jenis_subyek'] }}">
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default delete-subyek">Delete</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-subyek">
                                                            <td colspan="4"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-lampiran-berkas">
                                {{-- Form Input --}}
                                <div class="modal fade template" id="modal-form-berkas" role="basic" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Data Lampiran Berkas</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h4>Judul</h4>
                                                        <input type="text" class="form-control judul-lampiran">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Berkas Untuk Dilampirkan</h4>
                                                        <input type="file" id="upload-berkas" class="form-control" data-url="{{ URL::site('admin/document/upload_document') }}">
                                                        <input type="hidden" id="hidden-upload-berkas">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>URL</h4>
                                                        <input type="text" class="form-control url-lampiran">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Deskripsi</h4>
                                                        <textarea class="form-control deskripsi-lampiran" cols="30" rows="10"></textarea>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Akses</h4>
                                                        <select class="select2reference select2 form-control akses-lampiran">
                                                            <option></option>
                                                            <option value="publik">Publik</option>
                                                            <option value="tertutup">Tertutup</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Pembatasan Akses Berdasarkan Tipe Keanggotaan</h4>
                                                        <div class="icheck-list">
                                                            <label>
                                                                <input type="checkbox" value="1" class="icheck pembatasan-lampiran"> Standard
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-outline dark">Cancel</button>
                                                <button type="button" class="btn green add-lampiran">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Berkas Lampiran</span>
                                        </div>
                                        <div class="actions">
                                            <a id="tambah-lampiran" class="btn  btn-default" data-toggle="modal" href="#modal-form-berkas">
                                                <i class="icon-plus"></i> Tambah
                                            </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th> Judul </th>
                                                        <th> Berkas Lampiran </th>
                                                        <th> URL </th>
                                                        <th> Deskripsi </th>
                                                        <th> Akses </th>
                                                        <th> Pembatasan Akses </th>
                                                        <th> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-lampiran">
                                                    @if($existing_lampiran->count() > 0)
                                                        @foreach($existing_lampiran as $key => $xlampiran)
                                                            <tr class="row-data-lampiran">
                                                                <td class="judul-lampiran">
                                                                    {{ $xlampiran['judul_lampiran'] }}
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][judul_lampiran]" value="{{ $xlampiran['judul_lampiran'] }}">
                                                                </td>
                                                                <td class="dokumen-lampiran">
                                                                    <a target="_BLANK" href="{{ URL::base('storage/document/' . $xlampiran['dokumen_lampiran']) }}">{{ $xlampiran['dokumen_lampiran'] }}</a>
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][dokumen_lampiran]" value="{{ $xlampiran['dokumen_lampiran'] }}">
                                                                </td>
                                                                <td class="url-lampiran">
                                                                    {{ $xlampiran['url_lampiran'] }}
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][url_lampiran]" value="{{ $xlampiran['url_lampiran'] }}">
                                                                </td>
                                                                <td class="deskripsi-lampiran">
                                                                    {{ $xlampiran['deskripsi_lampiran'] }}
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][deskripsi_lampiran]" value="{{ $xlampiran['deskripsi_lampiran'] }}">
                                                                </td>
                                                                <td class="akses-lampiran">
                                                                    {{ ucfirst($xlampiran['akses_lampiran']) }}
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][akses_lampiran]" value="{{ $xlampiran['akses_lampiran'] }}">
                                                                </td>
                                                                <td class="pembatasan-lampiran">
                                                                    @if($xlampiran['pembatasan_lampiran'] == 1)
                                                                        {{ 'Yes' }}
                                                                    @else
                                                                        {{ 'No' }}
                                                                    @endif
                                                                    <input type="hidden" name="data_lampiran[{{ $key }}][pembatasan_lampiran]" value="{{ $xlampiran['pembatasan_lampiran'] }}">
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default delete-lampiran">Delete</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-lampiran">
                                                            <td colspan="7"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-status-peraturan">
                                {{-- Form Input --}}
                                <div class="modal fade template" id="modal-form-status-peraturan" role="basic" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Data Status Peraturan</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h4>Judul Dokumen Saat Ini</h4>
                                                        <input type="text" id="reflector-judul" disabled="true">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Status Peraturan</h4>
                                                        <select class="select2reference select2 form-control status-peraturan">
                                                            <option></option>
                                                            <option value="mencabut">Mencabut</option>
                                                            <option value="mencabut_sebagian">Mencabut Sebagian</option>
                                                            <option value="dicabut">Dicabut</option>
                                                            <option value="dicabut_sebagian">Dicabut Sebagian</option>
                                                            <option value="mengubah">Mengubah</option>
                                                            <option value="diubah">Diubah</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Judul Dokumen (Target)</h4>
                                                        <select class="form-control id-dokumen-target lookup-document" style="width: 100%;">
                                                            <option value="">Silahkan Pilih</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <h4>Catatan</h4>
                                                        <textarea class="form-control catatan-status-peraturan" cols="30" rows="10"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-outline dark">Cancel</button>
                                                <button type="button" class="btn green add-status-peraturan">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Status Peraturan</span>
                                        </div>
                                        <div class="actions">
                                            <a id="tambah-status" class="btn  btn-default" data-toggle="modal" href="#modal-form-status-peraturan">
                                                <i class="icon-plus"></i> Tambah
                                            </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th> Status Peraturan </th>
                                                        <th> Judul Dokumen (Target) </th>
                                                        <th> Catatan </th>
                                                        <th> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-status-peraturan">
                                                    @if($existing_status->count() > 0)
                                                        @foreach($existing_status as $key => $xstatus)
                                                            <tr class="row-data-status-peraturan">
                                                                <td class="id" style="display: none;">
                                                                    <input type="hidden" name="data_status[{{ $key }}][$id]" value="{{ $xstatus['$id'] }}">
                                                                </td>
                                                                <td class="tanggal-perubahan" style="display: none;">
                                                                    <input type="hidden" name="data_status[{{ $key }}][tanggal_perubahan]" value="{{ $xstatus['tanggal_perubahan'] }}">
                                                                </td>

                                                                <td class="status-peraturan">
                                                                    {{ ucfirst($xstatus['status_peraturan']) }}
                                                                    <input type="hidden" name="data_status[{{ $key }}][status_peraturan]" value="{{ $xstatus['status_peraturan'] }}">
                                                                </td>
                                                                <td class="id-dokumen-target">
                                                                    {{ Reference::create('id_dokumen_target')->to('Document', '$id', 'judul')->format('plain', $xstatus['id_dokumen_target']) }}
                                                                    <input type="hidden" name="data_status[{{ $key }}][id_dokumen_target]" value="{{ $xstatus['id_dokumen_target'] }}">
                                                                </td>
                                                                <td class="catatan-status-peraturan">
                                                                    {{ ucfirst($xstatus['catatan_status_peraturan']) }}
                                                                    <input type="hidden" name="data_status[{{ $key }}][catatan_status_peraturan]" value="{{ $xstatus['catatan_status_peraturan'] }}">
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default delete-status-peraturan">Delete</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-status-peraturan">
                                                            <td colspan="4"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <div class="btn-set pull-left">
                                <input type="button" value="Submit" class="btn green" onclick="$('#updateform').submit ()">
                            </div>
                            <div class="pull-right">
                                <a href="{{ f('controller.url') }}" class="btn blue"><i class="fa fa-arrow-left"></i> Back </a>
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
    </div>
@stop

@section('quick.nav')
@stop

@section('customjs')
    <!-- Custom JS -->
    {{-- Custom --}}
    <script src="<?php echo Theme::base('js/document.js') ?>" type="text/javascript"></script>

    <script>
        $(function(){
            /* Inisialisasi jenis dokumen */
            $('.lookup-document-type').select2({
                ajax: {
                    url: '{{ URL::site("get_document_type_by_name") }}',
                    dataType: 'json',
                    delay: 250,
                    cache: true,
                    data: function (params) {
                        var query = {
                            term: params.term,
                            type: $('select[name="tipe_dokumen"]').val()
                        }

                        return query;
                    },
                    processResults: function (data) {
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.name,
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                placeholder: "Silahkan Pilih",
                allowClear: true
            });

            /* Handling perubahan tipe dokumen */
            $('select[name="tipe_dokumen"]').on('change', function(){
                var value = $(this).val();

                $('.lookup-document-type').select2({
                    ajax: {
                        url: '{{ URL::site("get_document_type_by_name") }}',
                        dataType: 'json',
                        delay: 250,
                        cache: true,
                        data: function (params) {
                            var query = {
                                term: params.term,
                                type: $('select[name="tipe_dokumen"]').val()
                            }

                            return query;
                        },
                        processResults: function (data) {
                            return {
                                results: $.map(data, function (item) {
                                    return {
                                        text: item.name,
                                        id: item.id
                                    }
                                })
                            };
                        }
                    },
                    placeholder: "Silahkan Pilih",
                    allowClear: true
                });

                /* Hard code perubahan label sesuai dengan jenis peraturan yang dipilih. Seharusnya ini bisa dinamis nanti kedepannya */
                switch (value) {
                    case '1' :
                        $('.label-nomor').html('Nomor Peraturan');
                        $('.label-jenis').html('Jenis / Bentuk Peraturan');
                        $('.label-singkatan').html('Singkatan Jenis / Bentuk Peraturan');
                        $('.label-tempat').html('Tempat Penetapan');
                        $('.label-tanggal').html('Tanggal Penetapan');
                        break;
                    case '2' :
                        $('.label-nomor').html('Nomor Peraturan');
                        $('.label-tempat').html('Tempat Terbit');
                        break;
                    case '3' :
                        break;
                    case '4' :
                        $('.label-nomor').html('Nomor Putusan');
                        $('.label-jenis').html('Jenis / Bentuk Putusan');
                        $('.label-singkatan').html('Singkatan Jenis / Bentuk Putusan');
                        $('.label-tempat').html('Tempat Penetapan');
                        $('.label-tanggal').html('Tanggal Dibacakan');
                }

                if (value) {
                    $.ajax({
                        url: location.href.split('document')[0]+'document/get_meta',
                        method: 'GET',
                        data: { q: value }
                    }).done(function(result){
                        var data = JSON.parse(result);

                        $('.judul, .nomor_peraturan, .nomor_panggil, .jenis_peraturan, .singkatan_bentuk, .edisi, .tempat_terbit, .tahun_terbit, .penerbit, .tanggal_penetapan, .deskripsi_fisik, .sumber, .isbn, .bahasa, .bidang_hukum, .nomor_induk_buku').hide();

                        $.each(data.meta, function(k, v){
                            $('.'+v).show();
                        });

                        if (data.group == '2') {
                            $('.khusus-monografi').show();
                        } else {
                            $('.khusus-monografi').hide();
                        }
                    });
                } else {
                    $('.judul, .nomor_peraturan, .nomor_panggil, .jenis_peraturan, .singkatan_bentuk, .edisi, .tempat_terbit, .tahun_terbit, .penerbit, .tanggal_penetapan, .deskripsi_fisik, .sumber, .isbn, .bahasa, .bidang_hukum, .nomor_induk_buku').hide();
                }
            });

            /* Trigger agar pada saat load halaman pertama kali, handling perubahan tipe dokumen langsung jalan. Sebab kalau tidak, form tidak akan muncul */
            $('select[name="tipe_dokumen"]').trigger('change');

            /* Handling get data dokumen */
            $('.lookup-document').select2({
                ajax: {
                    url: '{{ URL::site("get_document") }}',
                    dataType: 'json',
                    delay: 250,
                    cache: true,
                    data: function (params) {
                        var query = {
                            term: params.term
                        }

                        return query;
                    },
                    processResults: function (data) {
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.judul,
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                placeholder: "Silahkan Pilih",
                allowClear: true
            });

            /* Bind value jenis peraturan */
            var jenisPeraturan = $('select[name="jenis_peraturan"]').data('id');
            $.ajax({
                type: 'GET',
                url: '{{ URL::site("get_existing_document_type") }}',
                data: { jenis_peraturan: jenisPeraturan }
            }).then(function (data) {
                data = JSON.parse(data);
                var option = new Option(data.name, data.id, true, true);

                $('select[name="jenis_peraturan"]').append(option).trigger('change');
            });
        });
    </script>
@stop

