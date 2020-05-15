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
    <div class="header header--second">
        <a href="http://localhost/website-bphn"><div class="logo__img logo__img--second logo__img--jdih"></div></a>
        <div class="content__search content__search--second">
            <form action="{{ URL::site('web/result') }}" class="form form--second">
                <input type="text" name="q" value="{{ isset($_GET['q']) ? $_GET['q'] : '' }}" class="form__input form__input--second" placeholder="pencarian">
                <button class="form__submit form__submit--second">
                    <div class="icon"></div>
                </button>
            </form>
        </div>
        <a href=""><div class="logo__img logo__img--second logo__img--bphn"></div></a>
    </div>
    <div class="content">
        <div class="detail clearfix">
            <div class="detail__left tb-30">
                <div class="detail__left__card">
                    <div class="detail__left__card__content detail__left__card__content--top">
                        <div class="title">Jenis Peraturan</div>
                        <div class="field">{{ $schema['jenis_peraturan']->format('plain', $result['jenis_peraturan']) }}</div>
                    </div>
                    <div class="detail__left__card__content detail__left__card__content--bottom detail__left__card__content--bottom--berlaku">
                        <div class="title">Status</div>
                        <div class="field">Berlaku</div>
                    </div>
                </div>
                <div class="detail__left__detail">
                    <div class="detail__left__detail__title">Download Peraturan</div>
                    <div class="detail__left__detail__field detail__left__detail__field--icon">
                        <a href=""><div class="icon"></div> Dokumen</a>
                    </div>
                </div>
                <div class="detail__left__detail">
                    <div class="detail__left__detail__title">Download File Analisa</div>
                    <div class="detail__left__detail__field detail__left__detail__field--icon">
                        <a href=""><div class="icon"></div> Dokumen</a>
                    </div>
                </div>
                <div class="detail__left__detail">
                    <div class="detail__left__detail__title">Keterangan Status</div>
                    <div class="detail__left__detail__field">
                        <ul class="detail__left__detail__field__ul">
                            <li>Mengubah
                                <a href="">Undang-Undang tahun 1995</a>
                                <div class="date">20 Juni 2001</div>
                            </li>
                            <li>Mengubah
                                <a href="">Undang-Undang tahun 1995</a>
                                <div class="date">20 Juni 2001</div>
                            </li>
                            <li>Mengubah
                                <a href="">Undang-Undang tahun 1995</a>
                                <div class="date">20 Juni 2001</div>
                            </li>
                            <li>Mengubah
                                <a href="">Undang-Undang tahun 1995</a>
                                <div class="date">20 Juni 2001</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="detail__center tb-70">
                <div class="detail__center__title">{{ $result['judul'] }}</div>
                <div>

                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Nomor</div>
                        <div class="detail__center__desc__field">{{ $result['nomor_peraturan'] }}</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tahun</div>
                        <div class="detail__center__desc__field">2004</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Instansi</div>
                        <div class="detail__center__desc__field">Berlaku</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Subjek</div>
                        <div class="detail__center__desc__field">Berlaku</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Tempat Penetapan</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Hasil Uji Materi</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Keterangan Hasil Uji</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">File Naskah Akademis</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Keterangan File Naskah Akademis</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">File Kajian</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Keterangan File Kajian</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                    <div class="detail__center__desc">
                        <div class="detail__center__desc__title">Keterangan Analisa</div>
                        <div class="detail__center__desc__field detail__center__desc__field--empty">Tidak Ada Deskripsi</div>
                    </div>
                </div>
            </div>
            <div class="detail__right tb-100">
                <div class="detail__preview"></div>
            </div>
        </div>
    </div>
    <div class="footer">
        Hak Cipta © 2018 BPHN, Badan Pembinaan Hukum Nasional
    </div>
</body>
</html>