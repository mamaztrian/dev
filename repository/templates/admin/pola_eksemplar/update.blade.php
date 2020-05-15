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
                                <?php $i = 0 ?>
                                @foreach (f('controller')->schema() as $name => $field)
                                    @if (!$field['hidden'])
                                        <div class="col-md-6">
                                            <div class="form-group form-md-line-input">
                                                {{ $field->label() }}
                                                {{ $entry->format($name, 'input') }}
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
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

@section('customjs')
    <script type="text/javascript">
        $(function() {
            $('input[name="prefix"], input[name="suffix"], input[name="length"]').on('keyup', function () {
                var prefix = $('input[name="prefix"]').val().trim(),
                    suffix = $('input[name="suffix"]').val().trim(),
                    length = '0'.repeat( $('input[name="length"]').val().trim()),
                    pattern = prefix + length + suffix;

                $('input[name="pattern"]').val(pattern);
            });
        });
    </script>
@stop

@section('quick.nav')
@stop



