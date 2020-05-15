<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ URL::base('web/fonts/stylesheet.css') }}">
    <link rel="stylesheet" href="{{ URL::base('web/style.css') }}">
    <title>JDIHN - BPHN</title>
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
        <div class="content__search content__search--second content__search--second--detail">
            <form action="{{ URL::site('web/result') }}" class="form form--second">
                <input type="text" name="q" value="{{ isset($_GET['q']) ? $_GET['q'] : '' }}" class="form__input form__input--second" placeholder="pencarian">
                <button class="form__submit form__submit--second">
                    <div class="icon"></div>
                </button>
            </form>
            <div class="content-back">
                <a href="#back" class="button-back" onclick="window.history.go(-1); return false;">
                    <div class="icon"></div>
                    Back
                </a>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="detail clearfix">
            <div class="detail__left tb-30 mb-100">
                <div class="detail__left__card">
                    <div class="detail__left__card__content detail__left__card__content--top">
                        <div class="title">Jenis Dokumen</div>
                        <div class="field">{{ $result['jenis_peraturan'] ? $schema['jenis_peraturan']->format('plain', $result['jenis_peraturan']) : '-' }}</div>
                    </div>
                    <div class="detail__left__card__content detail__left__card__content--bottom detail__left__card__content--bottom--mencabut">
                        <div class="title">Status</div>
                        <div class="field">{{ $result['status_terakhir'] ? $result['status_terakhir'] : '-' }}</div>
                    </div>
                </div>
                <div class="detail__left__detail">
                    <div class="detail__left__detail__title">Lampiran</div>
                    @if($data_lampiran->count() > 0)
                        <div class="detail__left__detail__field detail__left__detail__field--icon">
                            @foreach($data_lampiran as $lampiran)
                                <div style="margin-bottom: 8px;">
                                    <a class="lampiran" href="{{ URL::base('storage/document/' . $lampiran['dokumen_lampiran']) }}">
                                        {{ $lampiran['judul_lampiran'] ? $lampiran['judul_lampiran'] : $lampiran['dokumen_lampiran'] }}
                                    </a>
                                    <a class="icon" download href="{{ URL::base('storage/document/' . $lampiran['dokumen_lampiran']) }}"></a>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <div class="detail__left__detail__field">
                            -
                        </div>
                    @endif
                </div>
                <div class="detail__left__detail">
                    <div class="detail__left__detail__title">Keterangan Status</div>
                    <div class="detail__left__detail__field">
                        <ul class="detail__left__detail__field__ul">
                            @if($data_status->count() > 0)
                                @foreach($data_status as $peraturan)
                                    <li class="mencabut">
                                        {{ ucwords(str_replace('_', ' ', $peraturan['status_peraturan'])) }}
                                        <a href="{{ URL::site('web/result/' . $peraturan['id_dokumen_target'] . '/detail') }}">{{ $peraturan->format('id_dokumen_target', 'plain') }}</a>
                                        @if($peraturan['catatan_status_peraturan'])
                                            <div class="date"><b>Catatan :</b> {{ $peraturan['catatan_status_peraturan'] }}</div>
                                        @endif
                                    </li>
                                @endforeach
                            @else
                                -
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
            <div class="detail__center tb-70 mb-100">
                <div class="detail__center__title">{{ $result['judul'] }}</div>
                <div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tipe Dokumen</div>
                        <div class="detail__center__desc__field">{{ $result['tipe_dokumen'] }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Nomor Panggil</div>
                        <div class="detail__center__desc__field">{{ $result['nomor_panggil'] ? $result['nomor_panggil'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Cetakan / Edisi</div>
                        <div class="detail__center__desc__field">{{ $result['edisi'] }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tempat Terbit</div>
                        <div class="detail__center__desc__field">{{ $result['tempat_terbit'] }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Penerbit</div>
                        <div class="detail__center__desc__field">
                            {{ $result['penerbit'] ? $schema['penerbit']->format('plain', $result['penerbit']) : '-' }}
                        </div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tahun Penerbit</div>
                        <div class="detail__center__desc__field">{{ $result['tahun_terbit'] ? $result['tahun_terbit'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Deskripsi Fisik</div>
                        <div class="detail__center__desc__field">{{ $result['deskripsi_fisik'] ? $result['deskripsi_fisik'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">ISBN</div>
                        <div class="detail__center__desc__field">{{ $result['isbn'] ? $result['isbn'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Bahasa</div>
                        <div class="detail__center__desc__field">{{ $result['bahasa'] ? $bahasa[$result['bahasa']] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Nomor Induk Buku</div>
                        <div class="detail__center__desc__field">{{ $result['nomor_induk_buku'] ? $result['nomor_induk_buku'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tahun Terbit</div>
                        <div class="detail__center__desc__field">{{ $result['tahun_terbit'] ? $result['tahun_terbit'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tanggal Dibacakan</div>
                        <div class="detail__center__desc__field">{{ is_null($result['tanggal_dibacakan']) ? '-' : date('d M Y', strtotime($result['tanggal_dibacakan'])) }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Pernyataan Tanggung Jawab</div>
                        <div class="detail__center__desc__field">{{ $result['pernyataan_tanggung_jawab'] ? $result['pernyataan_tanggung_jawab'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Info Detil Spesifik</div>
                        <div class="detail__center__desc__field">{{ $result['info_detil_spesifik'] ? $result['info_detil_spesifik'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">GMD</div>
                        <div class="detail__center__desc__field">{{ $result['gmd'] ? $schema['gmd']->format('plain', $result['gmd']) : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Kala Terbit</div>
                        <div class="detail__center__desc__field">{{ $result['kala_terbit'] ? $result['kala_terbit'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Judul Seri</div>
                        <div class="detail__center__desc__field">{{ $result['judul_seri'] ? $result['judul_seri'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Klasifikasi</div>
                        <div class="detail__center__desc__field">{{ $result['klasifikasi'] ? $result['klasifikasi'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Abstrak</div>
                        <div class="detail__center__desc__field">{{ $result['abstrak'] ? $result['abstrak'] : '-' }}</div>
                    </div>
                    <div class="detail__center__desc detail__center__desc--table">
                        <div class="detail__center__desc__title">T.E.U Orang / Pengarang</div>
                        <div class="detail__center__desc__field">
                            <ul class="flat row">
                                <li>Nama Pengarang</li>
                                <li>Tipe Pengarang</li>
                                <li>Jenis Pengarang</li>
                            </ul>
                            @if($data_pengarang->count() > 0)
                                @foreach($data_pengarang as $pengarang)
                                    <ul class="flat">
                                        <li>{{ $pengarang->format('nama_pengarang', 'readonly') }}</li>
                                        <li>{{ $pengarang->format('tipe_pengarang', 'readonly') }}</li>
                                        <li>{{ $pengarang->format('jenis_pengarang', 'readonly') }}</li>
                                    </ul>
                                @endforeach
                            @else
                                <ul class="flat">
                                    <li class="empty-data"><center>Data tidak tersedia</center></li>
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="detail__center__desc detail__center__desc--table">
                        <div class="detail__center__desc__title">Subjek</div>
                        <div class="detail__center__desc__field">
                            <ul class="flat row">
                                <li>Kata Kunci</li>
                                <li>Tipe Kata Kunci</li>
                                <li>Jenis Kata Kunci</li>
                            </ul>
                            @if($data_subyek->count() > 0)
                                @foreach($data_subyek as $subyek)
                                    <ul class="flat">
                                        <li>{{ $subyek->format('subyek', 'readonly') }}</li>
                                        <li>{{ $subyek->format('tipe_subyek', 'readonly') }}</li>
                                        <li>{{ ucfirst($subyek['jenis_subyek']) }}</li>
                                    </ul>
                                @endforeach
                            @else
                                <ul class="flat">
                                    <li class="empty-data"><center>Data tidak tersedia</center></li>
                                </ul>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="detail__right tb-100">
                <div class="detail__preview">
                    <div class="default">
                        Preview
                    </div>
                    <div id="pdf">
                        <object width="100%" height="100%" type="application/pdf" data="" id="pdf_content">
                            <p>PDF cannot be displayed.</p>
                        </object>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<?php echo Theme::base('vendor/jquery/dist/jquery.min.js') ?>" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            $('.lampiran').on('click', function(e){
                var file = $(this).attr('href');
                $('#pdf_content').attr('data', file);
                $('.default').hide();
                return false;
            });

            $('.lampiran:first').trigger('click');
        });
    </script>

    <div class="footer">
        Hak Cipta © 2018 BPHN, Badan Pembinaan Hukum Nasional
    </div>
</body>
</html>