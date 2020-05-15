@extends('layout')

<?php
    use ROH\Util\Inflector;
    use App\Library\Pagination;
    use App\Library\WordHelper;
    use App\Controller\DocumentController;

    $word = new WordHelper();
    $keyword = explode(' ', $app->request->get('!search'));
?>

<?php
$schema = array();
foreach (f('controller')->schema() as $key => $field) {
    if ($field['list-column']) {
        $schema[$key] = $field;
    }
}
?>

@section('title')
    {{ l('{0}', Inflector::humanize(f('controller')->getClass())) . ' Listing' }}
@stop

@section('page.breadcumb.section')
    <li>
        <span>{{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</span>
    </li>
@stop


@section('fields')

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-comments font-green"></i>
                            <span class="caption-subject font-green bold uppercase">{{ l('{0}', Inflector::humanize(f('controller')->getClass())) }}</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-toolbar">
                            <div class="row">
                                <div class="col-md-7 col-sm-7 col-xs-12">
                                    <div class="btn-group">
                                        <a href="{{ f('controller.url', '/null/create') }}" id="sample_editable_1_new" class="btn sbold blue"> Create
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-12">
                                    @section('form-search')
                                        <form action="#" class="form" id="formsearch">
                                            <div class="form-group form-md-line-input search">
                                                <div class="input-group">
                                                    <div class="input-group-control">
                                                        <input type="text" class="form-control" id="searchbar" placeholder="Search...">
                                                    </div>
                                                    <div class="input-group-btn btn-right" style="border-bottom: 1px solid #c2cad8;">
                                                        <button type="button" class="btn" id="btn-advance">
                                                            <i class="fa fa-angle-down"></i>
                                                        </button>
                                                        <div class="advance">
                                                            <div class="portlet light">
                                                                <div class="portlet-body form">
                                                                    <div class="form-body">
                                                                        <div class="form-group form-md-line-input">
                                                                            <select name="tipe_dokumen" class="form-control lookup-main-document-type" style="width: 100%;">
                                                                                <option value="">Silahkan Pilih</option>
                                                                            </select>
                                                                            <label for="tipe_dokumen">Tipe Dokumen</label>
                                                                            <span class="help-block">Contoh : Peraturan Perundang - undangan, Monografi</span>
                                                                        </div>

                                                                        <div class="form-group form-md-line-input">
                                                                            <select name="jenis_peraturan" class="form-control lookup-document-type" style="width: 100%;">
                                                                                <option value="">Silahkan Pilih</option>
                                                                            </select>
                                                                            <label for="jenis_peraturan">Jenis Peraturan</label>
                                                                            <span class="help-block">Contoh : Peraturan Daerah, Peraturan Presiden</span>
                                                                        </div>

                                                                        <div class="form-group form-md-line-input">
                                                                            <input type="text" class="form-control" name="nomor_peraturan" id="nomor_peraturan" placeholder="Nomor Peraturan" autocomplete="off">
                                                                            <label for="nomor_peraturan">Nomor Peraturan</label>
                                                                            <span class="help-block">Contoh : 1, 2</span>
                                                                        </div>

                                                                        <div class="form-group form-md-line-input">
                                                                            <input type="text" class="form-control" name="tahun_terbit" id="tahun_terbit" placeholder="Tahun Terbit" autocomplete="off">
                                                                            <label for="tahun_terbit">Tahun Terbit</label>
                                                                            <span class="help-block">Contoh : 2011, 2012</span>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <button id="filtersearch" type="button" class="btn blue">Submit</button>
                                                                        <button type="button" class="btn default btn-cancel">Cancel</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="input-group-btn btn-right search-btn">
                                                        <button id="searchbutton" class="btn blue" type="button"><i class="icon-magnifier"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    @show
                                </div>
                            </div>
                            <div class="table-fix">
                                <div class="table-scrollable search-table">
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer fixed-tail" id="sample_1">
                                        @section('table.head')
                                        <thead>
                                            <tr>
                                                @if (count($schema))
                                                        <th>
                                                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                                <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
                                                                <span></span>
                                                            </label>
                                                        </th>
                                                        @foreach ($schema as $key => $field)
                                                        <th>
                                                            <a href="{{{ f('controller.url', '?!sort['.$key.']='.(@$_GET['!sort'][$key] == 1 ? -1 : 1)) }}}">{{ $field['label'] }} </a>
                                                        </th>
                                                        @endforeach
                                                        <th> Actions </th>
                                                @else
                                                    <th>Data</th>
                                                @endif
                                            </tr>
                                        </thead>
                                        @show
                                        <tbody>
                                            @section('table.body')
                                                @foreach ($entries as $entry)
                                                    <?php $i = 0 ?>
                                                    <tr>
                                                        @if (count($schema))
                                                                <td>
                                                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                                        <input type="checkbox" class="checkboxes search-checkbox" value="{{$entry['$id']}}" />
                                                                        <span></span>
                                                                    </label>
                                                                </td>
                                                            @foreach ($schema as $name => $field)
                                                                <td>
                                                                    @if($i++ === 0)
                                                                        <a href="{{ f('controller.url', '/'.$entry['$id']) }}">
                                                                            {{ $word->multipleHighlightPhrase($field->format('plain', $entry[$name], $entry), array_filter($keyword), '<strong class="highlight">') }}
                                                                        </a>
                                                                    @else
                                                                        <?php

                                                                        try {
                                                                            $string = $entry->format($name);

                                                                            if ($field['name'] == 'status_terakhir') {
                                                                                echo $word->getLastStatus($entry['$id'], $entry['status_terakhir']);
                                                                            } else {
                                                                                echo $word->multipleHighlightPhrase($string, array_filter($keyword), '<strong class="highlight">');
                                                                            }
                                                                        } catch (\Exception $e) {
                                                                            var_dump($e);
                                                                            exit;
                                                                            echo 'xxx';
                                                                        }
                                                                        ?>
                                                                    @endif
                                                                </td>
                                                            @endforeach
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
                                                                            <i class="fa fa-angle-down"></i>
                                                                        </button>
                                                                        <ul class="dropdown-menu pull-left search-action" role="menu">
                                                                            <li>
                                                                                <a href="{{ f('controller.url', '/'.$entry['$id'].'/update') }}">
                                                                                    <i class="icon-pencil"></i> Edit </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="{{ f('controller.url', '/'.$entry['$id'].'/delete') }}" class="delete-popup">
                                                                                    <i class="icon-trash"></i> Delete </a>
                                                                            </li>

                                                                        </ul>
                                                                    </div>
                                                                </td>
                                                        @else
                                                            <td><a href="{{ f('controller.url', '/'.$entry['$id']) }}">{{ $entry->format() }}</a></td>
                                                        @endif
                                                    </tr>
                                                @endforeach
                                            @show


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        <tr>
                            <div>
                                @if($entries->count(true))

                                            @section('pagination')
                                                <?php
                                                    $pagination = new Pagination($entries);
                                                    echo $pagination->paginate();
                                                ?>
                                            @show

                                @endif
                                <div class="pull-left pagination">
                                    <a href="{{f('controller.url','/:mutliid/delete')}}" class="btn red btn-multi-delete"> Delete <!-- <i class="fa fa-trash"></i> --></a>
                                </div>

                            </div>
                        </tr>
                    </div>
                </div>


        </div>
    </div>
@stop

@section('customjs')
    <script>
        $(function(){
            $('.lookup-main-document-type').select2({
                ajax: {
                    url: '{{ URL::site("get_main_document_type") }}',
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
                                    text: item.name.toUpperCase(),
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                placeholder: "Silahkan Pilih",
                allowClear: true
            });

            $('.lookup-document-type').select2({
                ajax: {
                    url: '{{ URL::site("get_document_type_by_name") }}',
                    dataType: 'json',
                    delay: 250,
                    cache: true,
                    data: function (params) {
                        var query = {
                            term: params.term,
                            type: $('.lookup-main-document-type').val()
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

            $('.lookup-main-document-type').on('change', function(){
                $('.lookup-document-type').select2({
                    ajax: {
                        url: '{{ URL::site("get_document_type_by_name") }}',
                        dataType: 'json',
                        delay: 250,
                        cache: true,
                        data: function (params) {
                            var query = {
                                term: params.term,
                                type: $('.lookup-main-document-type').val()
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
            });

            var jenisPeraturan = url.getquery('jenis_peraturan');
            if (jenisPeraturan) {
                $.ajax({
                    type: 'GET',
                    url: '{{ URL::site("get_existing_document_type") }}',
                    data: { jenis_peraturan: jenisPeraturan }
                }).then(function (data) {
                    data = JSON.parse(data);
                    var option = new Option(data.name, data.id, true, true);

                    $('select[name="jenis_peraturan"]').append(option).trigger('change');
                });
            }

            var tipeDokumen = url.getquery('tipe_dokumen');
            if (tipeDokumen) {
                $.ajax({
                    type: 'GET',
                    url: '{{ URL::site("get_existing_main_document_type") }}',
                    data: { tipe_dokumen: tipeDokumen }
                }).then(function (data) {
                    data = JSON.parse(data);
                    var option = new Option(data.name, data.id, true, true);

                    $('select[name="tipe_dokumen"]').append(option).trigger('change');
                });
            }
        });
    </script>
@stop