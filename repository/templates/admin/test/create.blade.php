@extends('layout')

<?php use ROH\Util\Inflector; ?>

@section('title')
    {{ l('{0}', Inflector::humanize(f('controller')->getClass())) . ' Create' }}
@stop

@section('page.breadcumb.section')
    <li>
        <a href="{{ f('controller.url') }}" >{{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</a>
        <i class="fa fa-circle"></i>
    </li>
    <li>
        <span>Create</span>
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
                            <span class="caption-subject font-green bold uppercase"> Create {{ l('{0}', Inflector::humanize(f('controller')->getClass())) }} </span>
                        @show
                    </div>
                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form method="post" id="createform" class="read">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="control-label">Tipe Dokumen</label>

                                        <select name="test" id="test"></select>

                                        <div class="form-control-focus"> </div>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="btn-set pull-left">
                                <input type="button" value="Submit" class="btn green" onclick="$('#createform').submit ()">
                                <!-- <a href="{{ f('controller.url') }}" class="btn blue"><i class="fa fa-arrow-left"></i> Back </a> -->
                            </div>
                            <div class="pull-right">
                                <input type="reset" value="Reset" class="btn yellow-lemon" onclick="$('#createform').reset ()">
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
    </div>
@stop

@section('customjs')
    <script>
        $(function(){
            /* Inisialisasi select2option */
            $('#test').select2({
                ajax: {
                    url: 'https://api.github.com/search/repositories',
                    dataType: 'json',
                    delay: 250,
                    cache: true,
                    placeholder: 'Search for a repository',
                    minimumInputLength: 1,
                    data: function (params) {
                        var query = {
                            q: params.term
                        }

                        return query;
                    },
                    processResults: function (data) {
                        return {
                            results: $.map(data.items, function (item) {
                                return {
                                    text: item.full_name,
                                    id: item.id
                                }
                            })
                        };
                    }
                }
            });

            /* Bind value */
            $.ajax({
                type: 'GET',
                url: 'https://api.github.com/repositories/19360043'
            }).then(function (data) {
                var option = new Option(data.full_name, data.id, true, true);
                $('#test').append(option).trigger('change');
            });
        });
    </script>
@stop

@section('quick.nav')
@stop



