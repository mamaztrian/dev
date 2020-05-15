$(function(){
    /* Handling clear tab form pengarang */
    $('#tambah-pengarang').on('click', function(){
        $('select.nama-pengarang, select.tipe-pengarang, select.jenis-pengarang').val(null).trigger('change');

        /* Set default value  */
        /* Berdasarkan request dari user, jika tipe dokumennya adalah peraturan perundang - undangan maka defaultnya tipe pengarangnya adalah badan organisasi  */
        if ($('select[name="tipe_dokumen"]').val() == 1) {
            $('select.tipe-pengarang').val(2).trigger('change');
        } else {
            $('select.tipe-pengarang').val(1).trigger('change');
        }
        $('select.jenis-pengarang').val(1).trigger('change');
    });

    /* Handling clear tab form subyek */
    $('#tambah-subyek').on('click', function(){
        $('select.tipe-subyek, select.jenis-subyek, select.subyek').val(null).trigger('change');

        /* Set default value  */
        $('select.jenis-subyek').val('primary').trigger('change');
        $('select.tipe-subyek').val(1).trigger('change');
    });

    /* Handling clear tab form lampiran */
    $('#tambah-lampiran').on('click', function(){
        $('input.judul-lampiran, input#hidden-upload-berkas, input.url-lampiran, textarea.deskripsi-lampiran').val('');
        $('select.akses-lampiran').val(null).trigger('change');
        $('.pembatasan-lampiran').prop('checked', false);
    });

    /* Handling clear tab form status */
    $('#tambah-status').on('click', function(){
        $('select.status-peraturan, select.id-dokumen-target, textarea.catatan-status-peraturan').val(null).trigger('change');
    });

    /* Handling rekflektor judul */
    $('form.form-document input[name="judul"]').on('change', function(){
        $('#reflector-judul').val($(this).val());
    });
    $('#reflector-judul').val($('form.form-document input[name="judul"]').val());

    /* Handling untuk input data pengarang */
    $('#tab-pengarang').on('click', '.add-pengarang', function(){
        /* Set value dari dropdown yang dipilih kedalam variable */
        var idNamaPengarang = $('select.nama-pengarang :selected').val(),
            namaPengarang = $('select.nama-pengarang :selected').text(),
            idTipePengarang = $('select.tipe-pengarang :selected').val(),
            tipePengarang = $('select.tipe-pengarang :selected').text(),
            idJenisPengarang = $('select.jenis-pengarang :selected').val(),
            jenisPengarang = $('select.jenis-pengarang :selected').text();

        /* Cek berapa banyak pengarang yang telah di add */
        var checkArrayKey = $('tbody#data-pengarang tr.row-data-pengarang').length;

        /* Generate template */
        var template =  '<tr class="row-data-pengarang">'+
                            '<td class="nama-pengarang">'+
                                namaPengarang+
                                '<input type="hidden" name="data_pengarang['+checkArrayKey+'][nama_pengarang]" value="'+idNamaPengarang+'">'+
                            '</td>'+
                            '<td class="tipe-pengarang">'+
                                tipePengarang+
                                '<input type="hidden" name="data_pengarang['+checkArrayKey+'][tipe_pengarang]" value="'+idTipePengarang+'">'+
                            '</td>'+
                            '<td class="jenis-pengarang">'+
                                jenisPengarang+
                                '<input type="hidden" name="data_pengarang['+checkArrayKey+'][jenis_pengarang]" value="'+idJenisPengarang+'">'+
                            '</td>'+
                            '<td>'+
                                '<div class="btn-group">'+
                                    '<button type="button" class="btn btn-default delete-pengarang">Delete</button>'+
                                '</div>'+
                            '</td>'+
                        '</tr>';

        /* Hilangkan row "Data belum tersedia" ketika data pengarang telah di add */
        if (checkArrayKey == 0) {
            $('tr.empty-data-pengarang').hide();
        }

        /* Append template kedalam tbody data pengarang */
        $('tbody#data-pengarang').append(template);

        /* Hide popup form input data pengarang */
        $('#modal-form-pengarang').modal('hide');
    });

    /* Handling ketika melakukan delete data pengarang */
    $('tbody#data-pengarang').on('click', '.delete-pengarang', function(){
        /* Menghapus row data pengarang */
        $(this).parents('.row-data-pengarang').remove();

        /* Cek berapa banyak data pengarang yang telah terinput */
        var checkRow = $('.row-data-pengarang').length;

        /* Jika data kosong / belum di input, maka row "Data belum tersedia" dimunculkan */
        if (checkRow < 1) {
            $('tr.empty-data-pengarang').show();
        }

        /* Generate penamaan input data pengarang agar indexnya sesuai */
        $.each($('.row-data-pengarang'), function(k, v){
            $(v).find('td.nama-pengarang input').attr('name', 'data_pengarang['+k+'][nama_pengarang]');
            $(v).find('td.tipe-pengarang input').attr('name', 'data_pengarang['+k+'][tipe_pengarang]');
            $(v).find('td.jenis-pengarang input').attr('name', 'data_pengarang['+k+'][jenis_pengarang]');
        });
    });

    /* Handling untuk input data subyek */
    $('#tab-subyek').on('click', '.add-subyek', function(){
        /* Set value dari dropdown yang dipilih kedalam variable */
        var subyek = $('select.subyek :selected').val(),
            idTipeSubyek = $('select.tipe-subyek :selected').val(),
            tipeSubyek = $('select.tipe-subyek :selected').text(),
            idJenisSubyek = $('select.jenis-subyek :selected').val(),
            jenisSubyek = $('select.jenis-subyek :selected').text();

        /* Cek berapa banyak subyek yang telah di add */
        var checkArrayKey = $('tbody#data-subyek tr.row-data-subyek').length;

        /* Generate template */
        var template =  '<tr class="row-data-subyek">'+
                            '<td class="subyek">'+
                                subyek+
                                '<input type="hidden" name="data_subyek['+checkArrayKey+'][subyek]" value="'+subyek+'">'+
                            '</td>'+
                            '<td class="tipe-subyek">'+
                                tipeSubyek+
                                '<input type="hidden" name="data_subyek['+checkArrayKey+'][tipe_subyek]" value="'+idTipeSubyek+'">'+
                            '</td>'+
                            '<td class="jenis-subyek">'+
                                jenisSubyek+
                                '<input type="hidden" name="data_subyek['+checkArrayKey+'][jenis_subyek]" value="'+idJenisSubyek+'">'+
                            '</td>'+
                            '<td>'+
                                '<div class="btn-group">'+
                                    '<button type="button" class="btn btn-default delete-subyek">Delete</button>'+
                                '</div>'+
                            '</td>'+
                        '</tr>';

        /* Hilangkan row "Data belum tersedia" ketika data subyek telah di add */
        if (checkArrayKey == 0) {
            $('tr.empty-data-subyek').hide();
        }

        /* Append template kedalam tbody data subyek */
        $('tbody#data-subyek').append(template);

        /* Hide popup form input data subyek */
        $('#modal-form-subyek').modal('hide');
    });

    /* Handling ketika melakukan delete data subyek */
    $('tbody#data-subyek').on('click', '.delete-subyek', function(){
        /* Menghapus row data subyek */
        $(this).parents('.row-data-subyek').remove();

        /* Cek berapa banyak data subyek yang telah terinput */
        var checkRow = $('.row-data-subyek').length;

        /* Jika data kosong / belum di input, maka row "Data belum tersedia" dimunculkan */
        if (checkRow < 1) {
            $('tr.empty-data-subyek').show();
        }

        /* Generate penamaan input data subyek agar indexnya sesuai */
        $.each($('.row-data-subyek'), function(k, v){
            $(v).find('td.subyek input').attr('name', 'data_subyek['+k+'][subyek]');
            $(v).find('td.tipe-subyek input').attr('name', 'data_subyek['+k+'][tipe_subyek]');
            $(v).find('td.jenis-subyek input').attr('name', 'data_subyek['+k+'][jenis_subyek]');
        });
    });

    /* Handling untuk input data status peraturan */
    $('#tab-status-peraturan').on('click', '.add-status-peraturan', function(){
        /* Set value dari dropdown yang dipilih kedalam variable */
        var idStatusPeraturan = $('select.status-peraturan :selected').val(),
            statusPeraturan = $('select.status-peraturan :selected').text(),
            idDokumenTarget = $('select.id-dokumen-target :selected').val(),
            judulStatusPeraturan = $('select.id-dokumen-target :selected').text(),
            catatanStatusPeraturan = $('textarea.catatan-status-peraturan').val();

        /* Cek berapa banyak status yang telah di add */
        var checkArrayKey = $('tbody#data-status-peraturan tr.row-data-status-peraturan').length;

        /* Generate template */
        var template =  '<tr class="row-data-status-peraturan">'+
                            '<td class="status-peraturan">'+
                                statusPeraturan+
                                '<input type="hidden" name="data_status['+checkArrayKey+'][status_peraturan]" value="'+idStatusPeraturan+'">'+
                            '</td>'+
                            '<td class="id-dokumen-target">'+
                                judulStatusPeraturan+
                                '<input type="hidden" name="data_status['+checkArrayKey+'][id_dokumen_target]" value="'+idDokumenTarget+'">'+
                            '</td>'+
                            '<td class="catatan-status-peraturan">'+
                                catatanStatusPeraturan+
                                '<input type="hidden" name="data_status['+checkArrayKey+'][catatan_status_peraturan]" value="'+catatanStatusPeraturan+'">'+
                            '</td>'+
                            '<td>'+
                                '<div class="btn-group">'+
                                    '<button type="button" class="btn btn-default delete-status-peraturan">Delete</button>'+
                                '</div>'+
                            '</td>'+
                        '</tr>';

        /* Hilangkan row "Data belum tersedia" ketika data status peraturan telah di add */
        if (checkArrayKey == 0) {
            $('tr.empty-data-status-peraturan').hide();
        }

        /* Append template kedalam tbody data status peraturan */
        $('tbody#data-status-peraturan').append(template);

        /* Hide popup form input data status peraturan */
        $('#modal-form-status-peraturan').modal('hide');
    });

    /* Handling ketika melakukan delete data status peraturan */
    $('tbody#data-status-peraturan').on('click', '.delete-status-peraturan', function(){
        /* Menghapus row data status peraturan */
        $(this).parents('.row-data-status-peraturan').remove();

        /* Cek berapa banyak data status peraturan yang telah terinput */
        var checkRow = $('.row-data-status-peraturan').length;

        /* Jika data kosong / belum di input, maka row "Data belum tersedia" dimunculkan */
        if (checkRow < 1) {
            $('tr.empty-data-status-peraturan').show();
        }

        /* Generate penamaan input data status peraturan agar indexnya sesuai */
        $.each($('.row-data-status-peraturan'), function(k, v){
            $(v).find('td.id input').attr('name', 'data_status['+k+'][$id]');
            $(v).find('td.tanggal-perubahan input').attr('name', 'data_status['+k+'][tanggal_perubahan]');
            $(v).find('td.status-peraturan input').attr('name', 'data_status['+k+'][status_peraturan]');
            $(v).find('td.id-dokumen-target input').attr('name', 'data_status['+k+'][id_dokumen_target]');
            $(v).find('td.catatan-status-peraturan input').attr('name', 'data_status['+k+'][catatan_status_peraturan]');
        });
    });

    /* Handling untuk input data lampiran */
    $('#tab-lampiran-berkas').on('click', '.add-lampiran', function(){
        /* Proses upload file */
        var files = $('input#upload-berkas').get(0).files,
            data = new FormData(),
            url = $('input#upload-berkas').data('url');

        $.each(files, function(key, value) {
            data.append(key, value);
        });

        $.ajax({
            url: url,
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            dataType: 'json',
            beforeSend: function()
            {
                $('#custom-loader').show();
            },
            xhr: function() {
                var myXhr = $.ajaxSettings.xhr();

                if (myXhr.upload) {
                    myXhr.upload.addEventListener('progress', function(e){
                        if (e.lengthComputable) {
                            var progress = Math.round(e.loaded / e.total * 100)

                            $('#progress-percent').html(progress + '%');
                        }
                    }, false);
                }

                return myXhr;
            },
            error: function(){
                $('#custom-loader').hide();
            },
            success: function(data, textStatus, jqXHR)
            {
                /* Set value dari dropdown yang dipilih kedalam variable */
                var judulLampiran = $('input.judul-lampiran').val(),
                    dokumenLampiran = $('input#hidden-upload-berkas').val(),
                    urlLampiran = $('input.url-lampiran').val(),
                    deskripsiLampiran = $('textarea.deskripsi-lampiran').val(),
                    idAkses = $('select.akses-lampiran :selected').val(),
                    akses = $('select.akses-lampiran :selected').text(),
                    pembatasanLampiran = $('.pembatasan-lampiran:checked').val();

                if (typeof(pembatasanLampiran) == 'undefined') {
                    pembatasanLampiranLabel = 'No';
                    pembatasanLampiranValue = 2;
                } else {
                    pembatasanLampiranLabel = 'Yes';
                    pembatasanLampiranValue = 1;
                }

                /* Cek berapa banyak lampiran yang telah di add */
                var checkArrayKey = $('tbody#data-lampiran tr.row-data-lampiran').length;

                /* Generate template */
                var template =  '<tr class="row-data-lampiran">'+
                                    '<td class="judul-lampiran">'+
                                        judulLampiran+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][judul_lampiran]" value="'+judulLampiran+'">'+
                                    '</td>'+
                                    '<td class="dokumen-lampiran">'+
                                        data.filename+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][dokumen_lampiran]" value="'+data.filename+'">'+
                                    '</td>'+
                                    '<td class="url-lampiran">'+
                                        urlLampiran+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][url_lampiran]" value="'+urlLampiran+'">'+
                                    '</td>'+
                                    '<td class="deskripsi-lampiran">'+
                                        deskripsiLampiran+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][deskripsi_lampiran]" value="'+deskripsiLampiran+'">'+
                                    '</td>'+
                                    '<td class="akses-lampiran">'+
                                        akses+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][akses_lampiran]" value="'+idAkses+'">'+
                                    '</td>'+
                                    '<td class="pembatasan-lampiran">'+
                                        pembatasanLampiranLabel+
                                        '<input type="hidden" name="data_lampiran['+checkArrayKey+'][pembatasan_lampiran]" value="'+pembatasanLampiranValue+'">'+
                                    '</td>'+
                                    '<td>'+
                                        '<div class="btn-group">'+
                                            '<button type="button" class="btn btn-default delete-lampiran">Delete</button>'+
                                        '</div>'+
                                    '</td>'+
                                '</tr>';

                /* Hilangkan row "Data belum tersedia" ketika data status peraturan telah di add */
                if (checkArrayKey == 0) {
                    $('tr.empty-data-lampiran').hide();
                }

                /* Append template kedalam tbody data status peraturan */
                $('tbody#data-lampiran').append(template);

                /* Hide popup form input data status peraturan */
                $('#modal-form-berkas').modal('hide');

                $('#custom-loader').hide();
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                console.log("UPLOAD FAILED", jqXHR);

                /* Hide popup form input data status peraturan */
                $('#modal-form-berkas').modal('hide');
            }
        });
    });

    /* Handling ketika melakukan delete data lampiran */
    $('tbody#data-lampiran').on('click', '.delete-lampiran', function(){
        /* Menghapus row data lampiran */
        $(this).parents('.row-data-lampiran').remove();

        /* Cek berapa banyak data lampiran yang telah terinput */
        var checkRow = $('.row-data-lampiran').length;

        /* Jika data kosong / belum di input, maka row "Data belum tersedia" dimunculkan */
        if (checkRow < 1) {
            $('tr.empty-data-lampiran').show();
        }

        /* Generate penamaan input data status peraturan agar indexnya sesuai */
        $.each($('.row-data-lampiran'), function(k, v){
            $(v).find('td.judul-lampiran input').attr('name', 'data_lampiran['+k+'][judul_lampiran]');
            $(v).find('td.dokumen-lampiran input').attr('name', 'data_lampiran['+k+'][dokumen_lampiran]');
            $(v).find('td.url-lampiran input').attr('name', 'data_lampiran['+k+'][url_lampiran]');
            $(v).find('td.deskripsi-lampiran input').attr('name', 'data_lampiran['+k+'][deskripsi_lampiran]');
            $(v).find('td.akses-lampiran input').attr('name', 'data_lampiran['+k+'][akses_lampiran]');
            $(v).find('td.pembatasan-lampiran input').attr('name', 'data_lampiran['+k+'][pembatasan_lampiran]');

        });
    });

    /* Inisiasi select2 option yang bisa ditambahkan secara langsung jika hasil pencarian pada dropdown tidak ditemukan */
    $(".select2reference.select22").select2({
        width: '100%',
        placeholder: 'Silahkan Pilih',
        tags: true,
        createTag: function (tag) {
            var found = false;

            $(".select2reference.select22 option").each(function() {
                if ($.trim(tag.term).toUpperCase() == $.trim($(this).text()).toUpperCase()) {
                    found = true;
                }
            });

            if (!found) {
                return {
                    id: tag.term,
                    text: tag.term + " (new)",
                    isNew: true
                };
            }
        }
    });

    /* Validasi */
    $('form.form-document').on('submit', function () {
        var type = $('select[name="tipe_dokumen"]').val(),
            judul = $('input[name="judul"]').val().trim(),
            pengarang = $('.row-data-pengarang').length;

        if (!type) {
            alert('Tipe dokumen harus diisi');
            return false;
        }

        if (!judul) {
            alert('Judul harus diisi');
            return false;
        }

        // if (pengarang == 0) {
        //     alert('Pengarang harus diisi');
        //     return false;
        // }

        switch (type) {
            case '1' :
                var tanggalPenetapan = $('input[name="tanggal_penetapan"]').val().trim(),
                    jenis = $('select[name="jenis_peraturan"]').val();

                // if (!tanggalPenetapan) {
                //     alert('Tanggal penetapan harus diisi');
                //     return false;
                // }

                if (!jenis) {
                    alert('Jenis dokumen harus diisi');
                    return false;
                }

                break;
            case '2' :
                var tahunTerbit = $('input[name="tahun_terbit"]').val().trim(),
                    tempatTerbit = $('select[name="tempat_terbit"]').val(),
                    penerbit = $('select[name="penerbit"]').val();

                if (!tahunTerbit) {
                    alert('Tahun terbit harus diisi');
                    return false;
                }

                if (!tempatTerbit) {
                    alert('Tempat terbit harus diisi');
                    return false;
                }

                if (!penerbit) {
                    alert('Penerbit harus diisi');
                    return false;
                }

                break;
            case '3' :
                var tahunTerbit = $('input[name="tahun_terbit"]').val().trim();

                if (!tahunTerbit) {
                    alert('Tahun terbit harus diisi');
                    return false;
                }

                break;
            case '4' :
                var tanggalPenetapan = $('input[name="tanggal_penetapan"]').val().trim(),
                    jenis = $('select[name="jenis_peraturan"]').val();

                if (!jenis) {
                    alert('Jenis dokumen harus diisi');
                    return false;
                }

                if (!tanggalPenetapan) {
                    alert('Tanggal dibacakan harus diisi');
                    return false;
                }

        }
    });
});