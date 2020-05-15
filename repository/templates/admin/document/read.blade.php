@extends('layout')

<?php use ROH\Util\Inflector; ?>
<?php use Norm\Schema\Reference; ?>

@section('title')
    {{ l('{0}', Inflector::humanize(f('controller')->getClass())) . ' Read' }}
@stop

@section('page.breadcumb.section')
    <li>
        <a href="{{ f('controller.url') }}" >{{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</a>
        <i class="fa fa-circle"></i>
    </li>
    <li>
        <span>
            Read
        </span>
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
                            <span class="caption-subject font-green bold uppercase"> {{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</span>
                        @show
                    </div>
                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form id="readform" class="read" class="form-vertiacal">
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
                                                                {{ $entry->format('tipe_dokumen', 'readonly') }}

                                                                <select name="tipe_dokumen" style="display: none;">
                                                                    <option value="{{$entry['tipe_dokumen']}}"></option>
                                                                </select>

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 jenis_peraturan" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-jenis">Jenis / Bentuk Monografi Hukum, Peraturan/Putusan</label>
                                                                {{ $entry->format('jenis_peraturan', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 bidang_hukum" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Bidang Hukum</label>
                                                                {{ $entry->format('bidang_hukum', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 judul" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Judul</label>
                                                                {{ $entry->format('judul', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_peraturan" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-nomor">Nomor Peraturan / Putusan</label>
                                                                {{ $entry->format('nomor_peraturan', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_panggil" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Nomor Panggil</label>
                                                                {{ $entry->format('nomor_panggil', 'input') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 singkatan_bentuk" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-singkatan">Singkatan Jenis/Bentuk Peraturan/Putusan</label>
                                                                {{ $entry->format('singkatan_bentuk', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 edisi" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Edisi</label>
                                                                {{ $entry->format('edisi', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tempat_terbit" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-tempat">Tempat Terbit</label>
                                                                {{ $entry->format('tempat_terbit', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 penerbit" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Penerbit</label>
                                                                {{ $entry->format('penerbit', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tanggal_penetapan" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label label-tanggal">Tanggal Penetapan</label>
                                                                {{ $entry->format('tanggal_penetapan', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 deskripsi_fisik" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Deskripsi Fisik</label>
                                                                {{ $entry->format('deskripsi_fisik', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 sumber" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Sumber</label>
                                                                {{ $entry->format('sumber', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 isbn" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">ISBN</label>
                                                                {{ $entry->format('isbn', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 bahasa" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Bahasa</label>
                                                                {{ $entry->format('bahasa', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 nomor_induk_buku" style="display: block;">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Nomor Induk Buku</label>
                                                                {{ $entry->format('nomor_induk_buku', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 tahun_terbit" style="display: block;">
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
                                        <div class="col-md-12 khusus-monografi" style="display: block;">
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
                                                                {{ $entry->format('tipe_koleksi_nomor_eksemplar', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Pola Nomor Eksemplar</label>
                                                                {{ $entry->format('pola_nomor_eksemplar', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Jumlah Eksemplar</label>
                                                                {{ $entry->format('jumlah_eksemplar', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 khusus-monografi" style="display: block;">
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
                                                                {{ $entry->format('kala_terbit', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Tanggal Dibacakan</label>
                                                                {{ $entry->format('tanggal_dibacakan', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>



                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Pernyataan Tanggung Jawab</label>
                                                                {{ $entry->format('pernyataan_tanggung_jawab', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">GMD</label>
                                                                {{ $entry->format('gmd', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Judul Seri</label>
                                                                {{ $entry->format('judul_seri', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Klasifikasi</label>
                                                                {{ $entry->format('klasifikasi', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Label</label>
                                                                {{ $entry->format('label', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Info Detil Spesifik</label>
                                                                {{ $entry->format('info_detil_spesifik', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Abstrak / Catatan</label>
                                                                {{ $entry->format('abstrak', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Gambar Sampul</label>
                                                                {{ $entry->format('gambar_sampul', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 khusus-monografi" style="display: block;">
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
                                                                {{ $entry->format('sembunyikan_di_opac', 'readonly') }}

                                                                <div class="form-control-focus"> </div>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group form-md-line-input">
                                                                <label class="control-label">Promosikan Ke Beranda</label>
                                                                {{ $entry->format('promosikan_ke_beranda', 'readonly') }}

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
                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Pengarang</span>
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
                                                    </tr>
                                                </thead>
                                                <tbody id="data-pengarang">
                                                    @if($existing_pengarang->count() > 0)
                                                        @foreach($existing_pengarang as $key => $xpengarang)
                                                            <tr class="row-data-pengarang">
                                                                <td class="nama-pengarang">
                                                                    {{ Reference::create('nama_pengarang')->to('Pengarang', '$id', 'name')->format('plain', $xpengarang['nama_pengarang']) }}
                                                                </td>
                                                                <td class="tipe-pengarang">
                                                                    {{ Reference::create('tipe_pengarang')->to('TipePengarang', '$id', 'name')->format('plain', $xpengarang['tipe_pengarang']) }}
                                                                </td>
                                                                <td class="jenis-pengarang">
                                                                    {{ Reference::create('jenis_pengarang')->to('JenisPengarang', '$id', 'name')->format('plain', $xpengarang['jenis_pengarang']) }}
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-pengarang">
                                                            <td colspan="3"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-subyek">
                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Kata Kunci</span>
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
                                                    </tr>
                                                </thead>
                                                <tbody id="data-subyek">
                                                    @if($existing_subyek->count() > 0)
                                                        @foreach($existing_subyek as $key => $xsubyek)
                                                            <tr class="row-data-subyek">
                                                                <td class="subyek">
                                                                    {{ $xsubyek['subyek'] }}
                                                                </td>
                                                                <td class="tipe-subyek">
                                                                    {{ Reference::create('tipe_subyek')->to('TipeKataKunci', '$id', 'name')->format('plain', $xsubyek['tipe_subyek']) }}
                                                                </td>
                                                                <td class="jenis-subyek">
                                                                    {{ ucfirst($xsubyek['jenis_subyek']) }}
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-subyek">
                                                            <td colspan="3"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-lampiran-berkas">
                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Berkas Lampiran</span>
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
                                                    </tr>
                                                </thead>
                                                <tbody id="data-lampiran">
                                                    @if($existing_lampiran->count() > 0)
                                                        @foreach($existing_lampiran as $key => $xlampiran)
                                                            <tr class="row-data-lampiran">
                                                                <td class="judul-lampiran">
                                                                    {{ $xlampiran['judul_lampiran'] }}
                                                                </td>
                                                                <td class="dokumen-lampiran">
                                                                    <a target="_BLANK" href="{{ URL::base('storage/document/' . $xlampiran['dokumen_lampiran']) }}">{{ $xlampiran['dokumen_lampiran'] }}</a>
                                                                </td>
                                                                <td class="url-lampiran">
                                                                    {{ $xlampiran['url_lampiran'] }}
                                                                </td>
                                                                <td class="deskripsi-lampiran">
                                                                    {{ $xlampiran['deskripsi_lampiran'] }}
                                                                </td>
                                                                <td class="akses-lampiran">
                                                                    {{ ucfirst($xlampiran['akses_lampiran']) }}
                                                                </td>
                                                                <td class="pembatasan-lampiran">
                                                                    @if($xlampiran['pembatasan_lampiran'] == 1)
                                                                        {{ 'Yes' }}
                                                                    @else
                                                                        {{ 'No' }}
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-lampiran">
                                                            <td colspan="6"><center>Data belum tersedia</center></td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-status-peraturan">
                                {{-- Listing Data --}}
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-social-dribbble font-green"></i>
                                            <span class="caption-subject font-green bold uppercase">Data Status Peraturan</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th> Status Peraturan </th>
                                                        <th> Judul </th>
                                                        <th> Catatan </th>
                                                        <th> Tanggal Perubahan </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-status-peraturan">
                                                    @if($existing_status->count() > 0)
                                                        @foreach($existing_status as $key => $xstatus)
                                                            <tr class="row-data-status-peraturan">
                                                                <td class="status-peraturan">
                                                                    {{ ucfirst($xstatus['status_peraturan']) }}
                                                                </td>
                                                                <td class="id-dokumen-target">
                                                                    {{ Reference::create('id_dokumen_target')->to('Document', '$id', 'judul')->format('plain', $xstatus['id_dokumen_target']) }}
                                                                </td>
                                                                <td class="catatan-status-peraturan">
                                                                    {{ ucfirst($xstatus['catatan_status_peraturan']) }}
                                                                </td>
                                                                <td class="catatan-status-peraturan">
                                                                    {{ $xstatus['tanggal_perubahan'] ? date('d F Y - H:i:s', strtotime($xstatus['tanggal_perubahan'])) : '' }}
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr class="empty-data-status-peraturan">
                                                            <td colspan="3"><center>Data belum tersedia</center></td>
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
                                <a href="{{ f('controller.url', '/'.$entry['$id'].'/update') }}" class="btn green tooltips">Update</a>
                                <!-- <a href="{{ f('controller.url') }}" class="btn blue"><i class="fa fa-arrow-left"></i> Back </a> -->
                            </div>
                            <div class="pull-right">
                                <a href="{{ f('controller.url', '/'.$entry['$id'].'/delete') }}" class="btn red delete-popup">Delete</a>
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
    <script src="<?php echo Theme::base('js/document.js') ?>" type="text/javascript"></script>
@stop



