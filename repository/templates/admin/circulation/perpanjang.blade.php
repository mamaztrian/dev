@section('modal-content')
<form method="post" id="deleteRecord" action="{{{ URL::current() }}}">
    <div class="modal-header">
        <h4 class="modal-title">Perpanjang Circulation</h4>
    </div>
    <div class="modal-body">
        <table style="width: 100%" class="table table-striped">
            <thead>
                <tr>
                    <th>Peminjam</th>
                    <th>Buku</th>
                </tr>
            </thead>
            <tr>
                <td>{{ $peminjam }}</td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="modal-footer">
        <!-- <button type="reset" class="btn blue cancel" onclick="$.fn.popup().close(); return false;">
            <i class="fa fa-reply"></i>
            <span> Cancel </span>
        </button> -->
        <button type="button" class="btn blue delete" onclick="$('#deleteRecord').submit ();">
            <!-- <i class="fa fa-trash-o"></i> -->
            <span> Perpanjang </span>
        </button>
    </div>
</form>
@show