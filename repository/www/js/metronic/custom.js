var url = {
    getquery: function(name, url) {
        url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
}

$(function() {
    /* Searchbar */
    $("form#formsearch input#searchbar").keypress(function(evt) {
        if (evt.keyCode == 13) {
            evt.preventDefault();

            var findValue = $(this).val();
            var Url = window.location.href.replace(/\?.*/g, "");
            if (findValue.length == 0) {
                var finderUrl = Url;
            } else {
                var finderUrl = Url + '?!search=' + findValue;
            }
            window.location = finderUrl;
        }
    });

    $("form#formsearch #searchbutton").on('click', function(evt) {
        evt.preventDefault();

        var findValue = $("form#formsearch input#searchbar").val();
        var Url = window.location.href.replace(/\?.*/g, "");

        if (findValue.length == 0) {
            var finderUrl = Url;
        } else {
            var finderUrl = Url + '?!search=' + findValue;
        }
        window.location = finderUrl;
    });
    $("form#formsearch #filtersearch").on('click', function(evt) {
        var params = $('form#formsearch').serialize();
        var searchbacValue = $("form#formsearch input#searchbar").val();
        var Url = window.location.href.replace(/\?.*/g, "");
        var finderUrl = Url + '?!search=' + searchbacValue + '&' + params;

        window.location = finderUrl;
    });

    $("form#formsearch input#searchbar").val(url.getquery('!search'));
    $("form#formsearch #tahun_terbit").val(url.getquery('tahun_terbit'));
    $("form#formsearch #nomor_peraturan").val(url.getquery('nomor_peraturan'));

    $('.group-checkable').click(function(event) {
        if (this.checked) {
            // Iterate each checkbox
            $('.checkboxes').each(function() {
                this.checked = true;
            });
        } else {
            $('.checkboxes').each(function() {
                this.checked = false;
            });
        }
    });

    // popup delete
    $(function() {
        $("a.delete-popup").popup();
        $('.popup').popup({
            afterLoad: function() {
                Themes.init($('#' + this.id));
                DatePicker.init($('#' + this.id));
                InputMask.init($('#' + this.id));
                Select2Reference.init($('#' + this.id));
            }
        })
    });

    $(function() {
        $('data-repeater-item:first-child').find('.button-delete').hide();
        $('data-repeater-item').find('.button-add').hide();
    });

    //multiple delete on search
    $('a.btn-multi-delete').click(function(e) {
        e.preventDefault();
        var $delete = [];
        $('input.search-checkbox').each(function(e) {
            if ($(this).is(':checked')) {
                $delete.push($(this).val());
            }
        });

        if ($delete.length > 0) {
            $(this).popup({ url: $(this).attr('href').toString().replace(':mutliid', $delete.join()), eventtarget: e });
        }
    });

    //search advance
    $('#btn-advance').on('click', function() {
        $('.advance').animate({ height: 'toggle' }, 'fast');
    });

    $('.advance .btn-cancel').on('click', function() {
        $('.advance').hide();
    });
});

$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();