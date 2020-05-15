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
        <span>Stock Opname</span>
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
                        <!-- <span class="caption-helper">demo form...</span> -->
                    </div>
                    <!-- <div class="tools">
                        <a href="javascript:;" class="collapse"> </a>
                        <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                        <a href="javascript:;" class="reload"> </a>
                        <a href="javascript:;" class="remove"> </a>
                    </div> -->
                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form method="post">
                    	<input type="text" name="buku">
                    	<input type="Submit" name="submit">
                    </form>
                    <br>
                    <!-- <form method="post" id="createform" class="read">
                        <div class="form-body">
                            <div class="row">

                            </div>
                        </div>
                    </form> -->
                    <?php if (count($data) == 0 ): ?>
                    	<div><h3>NO DATA ENTRY</h3></div>
                    <?php else: ?>
	                    <div class="table-fixed-head">
	                    	<section>
							  <!--for demo wrap-->
							  <div class="tbl-header">
							    <table class="table-fixed-head">
							      <thead>
							        <tr>
							          <th>no</th>
							          <!-- <th>Id Stok Opname</th> -->
							          <th>Nomor Panggil</th>
							          <th>Nama</th>
							        </tr>
							      </thead>
							    </table>
							  </div>
							  <br>
							  <div class="tbl-content">
							    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped fixed-body">
							      <tbody>
							      	<?php $no = 1; ?>
	                    			<?php foreach ($data as $key => $value): ?>
                                    <?php $buku = Norm::factory('Document')->findOne(array('$id'=>$value['name'])); ?>
								        <tr>
								        	<td>{{ $no }}</td>
			                    			<!-- <td>{{ $value['id_stock_opname'] }}</td> -->
			                    			<td>{{ $value['nomor_panggil_doc'] }}</td>
			                    			<td>{{ $buku['judul'] }}</td>
								        </tr>
								    <?php $no++; ?>
	                    			<?php endforeach ?>
							      </tbody>
							    </table>
							  </div>
							</section>
	                    </div>
                    <?php endif ?>
                    <div class="form-actions">
                        <div class="btn-set pull-left">
                            <!-- <input type="button" value="Submit" class="btn green"> -->
                            <a href="{{ Url::site('stock_opname/'. $id .'/finish') }}" class="btn blue">Selesai </a>
                            <a href="{{ Url::site('stock_opname') }}" class="btn red">Simpan Pekerjaan </a>
                        </div>
                    </div>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
    </div>
@stop

@section('quick.nav')
@stop



