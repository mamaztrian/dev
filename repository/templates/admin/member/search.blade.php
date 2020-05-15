@extends('layout')

<?php
use ROH\Util\Inflector;
use App\Library\Pagination;

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
                        <div class="actions"></div>
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
                                                    </span>
                                                    <div class="input-group-control">
                                                        <input type="text" class="form-control" id="searchbar" placeholder="Search...">
                                                        <div class="form-control-focus"> </div>
                                                    </div>

                                                    <span class="input-group-btn btn-right search-btn">
                                                        <button class="btn blue" type="button"><i class="icon-magnifier"></i></button>
                                                    </span>
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
                                                                        <a href="{{ f('controller.url', '/'.$entry['$id']) }}">{{ substr($field->format('plain', $entry[$name], $entry), 0, 48) }}</a>
                                                                    @else
                                                                        <?php try { $string = strip_tags($entry->format($name)); echo substr($string, 0, 48); } catch(\Exception $e) { echo 'xxx';  } ?>
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
                                                                            <li>
                                                                                <a href="{{ f('controller.url', '/null/'.$entry['$id'].'/print_kartu') }}" target="blank">
                                                                                    <i class="icon-trash"></i> Cetak Kartu </a>
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

