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
            <div>
                <!-- BEGIN GENERAL PORTLET-->
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-user font-blue-sharp"></i>
                            <span class="caption-subject font-blue-sharp bold uppercase">S I R K U L A S I</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('admin/circulation/null/create'); ?>">
                                    <h2>Start Transaction</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('artist'); ?>">
                                    <h2>Quick Return</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('license_master'); ?>">
                                    <h2>Loan Rules</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('song_claim'); ?>">
                                    <h2>Loan History</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('genre'); ?>">
                                    <h2>Overdued List</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                            <div class="col-md-6">
                                <a href="<?php echo URL::site('instrument'); ?>">
                                    <h2>Reservation</h2>
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare
                                    nulla.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END GENERAL PORTLET-->
        </div>
    </div>
@stop

