<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ URL::base('web/fonts/stylesheet.css') }}">
    <link rel="stylesheet" href="{{ URL::base('web/style.css') }}">
    {{-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/0a337f34aa.js"></script> --}}
    <link rel="stylesheet" href="{{ URL::base('web/fontawesome/css/all.min.css') }}">
    <script src="{{ URL::base('web/fontawesome/js/all.js') }}"></script>

    <title>JDIHN - BPHN</title>
</head>

<body class="index">
    <header class="t3-header" id="t3-header">
        <div class="container__menu__top">
            <div class="menu_top">
                <div class="menu_left">
                    <i class="fas fa-comments"></i> Pusat Dokumentasi & Jaringan Informasi Hukum Kantor Wilayah Jawa Tengah
                </div>
            </div>
        </div>
    </header>

    <div class="table">
        <div class="table-cell">
            <div class="header index">
                <img src="{{ URL::base('web/images/logo-jdihn-index.png') }}" class="logo">
                <div class="title">
                    Pusat Jaringan Dokumentasi Informasi Hukum Nasional
                </div>
            </div>
            <div class="content--index">
                <div class="content__search">
                    <form action="{{ URL::site('web/result') }}" class="form">
                        <input type="text" name="q" class="form__input" placeholder="Pencarian" autocomplete="off">
                        <button class="form__submit">
                            <div class="icon"></div>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer index">
        Hak Cipta © 2018 BPHN, Badan Pembinaan Hukum Nasional
    </div>
</body>

</html>