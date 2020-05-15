<?php
    use App\Provider\WebProvider;
    use App\Library\Pagination3;
        use App\Library\WordHelper;

    $word = new WordHelper();
    $web = new WebProvider();
    $pagination = new Pagination3($count);
    $skip = (!isset($_GET['skip']) || $_GET['skip'] == 0) ? 0 : $_GET['skip'];
?>

<html lang="en">
<head>
    <title>JDIHN - BPHN</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="{{ URL::base('web/fonts/stylesheet.css') }}">
    <link rel="stylesheet" href="{{ URL::base('web/style.css') }}">
    <link rel="stylesheet" href="{{ Theme::base('js/select2/css/select2.min.css') }}" />
    <link rel="stylesheet" href="{{ Theme::base('js/select2/css/select2-bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ URL::base('web/fontawesome/css/all.min.css') }}">

    <style>
        strong.highlight {
            color: #bd5a5a;
        }
    </style>

    <script src="{{ URL::base('web/fontawesome/js/all.js') }}"></script>
</head>

<body>
    <header class="t3-header" id="t3-header">
        <div class="container__menu__top">
            <div class="menu_top">
                <div class="menu_left">
                    <i class="fas fa-comments"></i> {{ $nama }}
                </div>
            </div>
        </div>
    </header>
    <div class="header header--second">
        <a href="{{ URL::site('web/result') }}"><div class="logo__img logo__img--second logo__img--jdih"></div></a>
        <div class="content__search content__search--second">
            <form id="simple-search" action="{{ URL::site('web/result') }}" class="form form--second">
                <input type="text" name="q" value="{{ isset($_GET['q']) ? $_GET['q'] : '' }}" class="form__input form__input--second" placeholder="pencarian">
                <button class="form__submit form__submit--second">
                    <div class="icon"></div>
                </button>
            </form>
        </div>
    </div>
    <div class="content">
        <p class="result__summary tb-left">Hasil pencarian sebanyak <b>{{ number_format($count['count']) }}</b> data</p>
        <button class="result__filter__button tb-right none">Filter Pencarian</button>

        <div class="result clearfix">
            {{-- Filter --}}
            <div class="result__filter tb-100">
                <form id="filter-search" action="{{ URL::site('web/result') }}" method="get">
                    <input type="hidden" name="q">
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/jenis.png'); }}')"></div>
                            Berdasarkan Tipe Dokumen
                        </div>
                        <div class="result__filter__item__field">
                            <select name="tipe_dokumen" class="tipe-dokumen"></select>
                        </div>
                    </div>
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/jenis.png'); }}')"></div>
                            Berdasarkan Jenis Dokumen
                        </div>
                        <div class="result__filter__item__field">
                            <select name="jenis_peraturan" class="searchreference"></select>
                        </div>
                    </div>
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/jenis.png'); }}')"></div>
                            Berdasarkan Nama Pengarang
                        </div>
                        <div class="result__filter__item__field">
                            <select name="nama_pengarang" class="nama-pengarang"></select>
                        </div>
                    </div>
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/nomor.png'); }}')"></div>
                            Berdasarkan Nomor
                        </div>
                        <div class="result__filter__item__field">
                            <input name="nomor_peraturan" type="text" autocomplete="off" placeholder="Contoh : 1,2,3">
                        </div>
                    </div>
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/tahun.png'); }}')"></div>
                            Berdasarkan Tahun
                        </div>
                        <div class="result__filter__item__field">
                            <select name="tahun_terbit" multiple="multiple" class="tahun-terbit">
                                @for($i=date('Y'); $i>=1800; $i--)
                                    <option value="{{$i}}">{{$i}}</option>
                                @endfor
                            </select>
                        </div>
                    </div>
                    <div class="result__filter__item">
                        <div class="result__filter__item__title">
                            <div class="icon" style="background-image: url('{{ URL::base('web/icons/status.png'); }}')"></div>
                            Berdasarkan Status
                        </div>
                        <div class="result__filter__item__field">
                            <div class="result__filter__item__field__radio">
                                <div class="radio">
                                    <input type="checkbox" id="mengubah" name="status_terakhir[]" value="mengubah" />
                                    <label for="mengubah">Mengubah</label>
                                </div>
                                <div class="radio">
                                    <input type="checkbox" id="diubah" name="status_terakhir[]" value="diubah" />
                                    <label for="diubah">Diubah</label>
                                </div>
                                <div class="radio">
                                    <input type="checkbox" id="mencabut" name="status_terakhir[]" value="mencabut" />
                                    <label for="mencabut">Mencabut</label>
                                </div>
                                <div class="radio">
                                    <input type="checkbox" id="mencabut_sebagian" name="status_terakhir[]" value="mencabut_sebagian" />
                                    <label for="mencabut_sebagian">Mencabut Sebagian</label>
                                </div>
                                <div class="radio">
                                    <input type="checkbox" id="dicabut" name="status_terakhir[]" value="dicabut" />
                                    <label for="dicabut">Dicabut</label>
                                </div>
                                <div class="radio">
                                    <input type="checkbox" id="dicabut_sebagian" name="status_terakhir[]" value="dicabut_sebagian" />
                                    <label for="dicabut_sebagian">Dicabut Sebagian</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="button-filter">
                        <input type="submit" class="filter-submit">
                    </div>
                </form>
            </div>

            {{-- Results --}}
            <div class="result__content tb-100">
                @foreach($results as $result)
                    <div class="result__content__item result__content__item--berlaku">
                        <div class="result__content__item__number">
                            <div class="numb"> Nomor : <span class="result-value">{{ $result['nomor_peraturan'] ? $result['nomor_peraturan'] : '-'  }}</span></div>

                            @if($result['tipe_dokumen_id'] == 4)
                                <div class="numb separator"> Tahun : <span class="result-value">{{ $result['tanggal_penetapan'] ? date('Y', strtotime($result['tanggal_penetapan'])) : '-'  }}</span></div>
                            @else
                                <div class="numb separator"> Tahun : <span class="result-value">{{ $result['tahun_terbit'] ? $result['tahun_terbit'] : '-'  }}</span></div>
                            @endif

                            <div class="status">
                                {{ $result['status_terakhir'] ? ucwords(str_replace('_', ' ', $result['status_terakhir'])) : '-' }}
                            </div>
                        </div>
                        <div class="result__content__item__title"><a href="{{ URL::site('web/result/' . $result['id'] . '/detail') }}">{{ $word->multipleHighlightPhrase($result['judul'], array_filter($keywords), '<strong class="highlight">') }}</a></div>

                        {{ $web::getStatus($result['id'], $_GET) }}
                    </div>
                @endforeach

                <div class="result__pagination">
                    {{ $pagination->paginate() }}
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        Hak Cipta © 2018 BPHN, Badan Pembinaan Hukum Nasional
    </div>

    <script src="{{ URL::base('web/js/jquery/dist/jquery.min.js') }}" type="text/javascript"></script>
    <script src="{{ URL::base('web/js/main.js') }}" type="text/javascript"></script>
    <script src="{{ Theme::base('js/select2/js/select2.full.min.js') }}" type="text/javascript"></script>
    <script src="{{ Theme::base('js/select2/js/select2.js') }}" type="text/javascript"></script>

    <script>
        $(function(){
            /* Inisialisasi select2option */
            $('.tahun-terbit').select2({
                multiple: true,
                placeholder: 'Pilih tahun'
            });

            $('.tipe-dokumen').select2({
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
                                    text: item.name + ' ('+ item.count +')',
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                allowClear: true,
                placeholder: 'Pilih tipe dokumen'
            });

            $('.nama-pengarang').select2({
                ajax: {
                    url: '{{ URL::site("get_nama_pengarang") }}',
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
                                    text: item.name,
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                allowClear: true,
                placeholder: 'Pilih pengarang'
            });

            $('.searchreference').select2({
                ajax: {
                    url: '{{ URL::site("get_document_type_by_name") }}',
                    dataType: 'json',
                    delay: 250,
                    cache: true,
                    data: function (params) {
                        var query = {
                            term: params.term,
                            type: $('.tipe-dokumen').val()
                        }

                        return query;
                    },
                    processResults: function (data) {
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.name + ' ('+ item.count +')',
                                    id: item.id
                                }
                            })
                        };
                    }
                },
                allowClear: true,
                placeholder: 'Pilih jenis dokumen'
            });

            $('.tipe-dokumen').on('change', function () {
                $('.searchreference').val(null).trigger('change');

                $('.searchreference').select2({
                    ajax: {
                        url: '{{ URL::site("get_document_type_by_name") }}',
                        dataType: 'json',
                        delay: 250,
                        cache: true,
                        data: function (params) {
                            var query = {
                                term: params.term,
                                type: $('.tipe-dokumen').val()
                            }

                            return query;
                        },
                        processResults: function (data) {
                            return {
                                results: $.map(data, function (item) {
                                    return {
                                        text: item.name + ' ('+ item.count +')',
                                        id: item.id
                                    }
                                })
                            };
                        }
                    },
                    allowClear: true,
                    placeholder: 'Pilih jenis dokumen'
                });
            });

            /* Add value q into filtering */
            $('form#filter-search').on('submit', function(evt){
                var q = $('form#simple-search input[name="q"]').val();
                $('form#filter-search input[name="q"]').val(q);

                var thTerbit = new Array();
                var params = new Array();
                $.each($('form#filter-search').serializeArray(), function(k, v){
                    if (v.value) {
                        if (v.name == 'tahun_terbit') {
                            thTerbit.push(v.value);
                        } else {
                            params.push(v.name + '=' + v.value);
                        }
                    }
                });
                if (thTerbit.length > 0) {
                    params.push('tahun_terbit' + '=' + thTerbit.join(','));
                }
                var queryString = params.join('&');
                var baseurl = window.location.href.replace(/\?.*/g, "");

                window.location = baseurl + '?' + queryString;

                return false;
            });

            /* Start apply existing filter */
            var url = new URL(location.href);


            setTimeout(function(){
                var tipeDokumen = url.searchParams.get('tipe_dokumen');
                if (tipeDokumen != null) {
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

                var namaPengarang = url.searchParams.get('nama_pengarang');
                if (namaPengarang != null) {
                    $.ajax({
                        type: 'GET',
                        url: '{{ URL::site("get_existing_pengarang") }}',
                        data: { nama_pengarang: namaPengarang }
                    }).then(function (data) {
                        data = JSON.parse(data);
                        var option = new Option(data.name, data.id, true, true);

                        $('select[name="nama_pengarang"]').append(option).trigger('change');
                    });
                }

                var jenisPeraturan = url.searchParams.get('jenis_peraturan');
                if (jenisPeraturan != null) {
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

                var nomorPeraturan = url.searchParams.get('nomor_peraturan');
                if (nomorPeraturan != null) {
                    $('input[name="nomor_peraturan"]').val(nomorPeraturan);
                }

                var tahunTerbit = url.searchParams.get('tahun_terbit');
                if (tahunTerbit) {
                    $('select[name="tahun_terbit"]').val(tahunTerbit.split(',')).trigger('change');
                }

                var dataStatus = new Array();
                $.each(location.search.split('&'), function(k, v){
                    if(v.match('status_terakhir')){
                        var splitData = v.split('=');

                        dataStatus.push(splitData[1]);
                    }
                });

                $("input[name='status_terakhir[]']").each(function(k, v){
                    var data = $(v).val();

                    if ($.inArray(data, dataStatus) >= 0) {
                        $(v).prop('checked', true);
                    }
                });
            }, 1000);
            /* End apply existing filter */
        });
    </script>
</body>
</html>