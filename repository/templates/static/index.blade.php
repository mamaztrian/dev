@extends('layout')

@section('page.breadcumb')
@endsection

@section('content')
    <div>
        @section('page.title')
        <h1 class="page-title"> Welcome
            <small>{{ isset($_SESSION['user']) ? $_SESSION['user']['first_name'] . ' ' . $_SESSION['user']['last_name'] : '' }}, this is a great apps</small>
        </h1>
        @show
    </div>
@endsection

@section('customjs')
@endsection

@section('contextual')
@endsection



