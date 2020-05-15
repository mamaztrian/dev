@extends('layout')

<?php use ROH\Util\Inflector; ?>

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
                    <form method="post" id="updateform" class="read">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('nama_inventarisasi', 'input') }}
                                        <label>Nama Inventarisasi</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('gmd', 'input') }}
                                        <label>GMD</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('type_koleksi', 'input') }}
                                        <label>Type Koleksi</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('lokasi', 'input') }}
                                        <label>Lokasi</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('lokasi_rak', 'input') }}
                                        <label>Lokasi Rak</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        {{ $entry->format('klasifikasi', 'input') }}
                                        <label>Klasifikasi</label>
                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="caption pull-left">
                                <input type="button" value="Submit" class="btn green" onclick="$('#updateform').submit ()">
                                <!-- <a href="javascript:history.back()" class="btn blue"><i class="fa fa-arrow-left"></i> Back </a> -->
                            </div>
                            <div class="btn-set pull-right">
                                <input type="reset" value="Reset" class="btn yellow-lemon" onclick="$('#updateform').reset ()">
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



