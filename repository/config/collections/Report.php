<?php

use Norm\Schema\Stringz;
use App\Schema\InputMask;
use App\Schema\Thumbnail;
use App\Schema\FileUpload;
use Norm\Schema\Reference;
use App\Schema\SelectTwoReference;
use App\Schema\MultiReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use App\Schema\SearchReference;
use Norm\Schema\NormDate;
use Norm\Schema\NormDateTime;
use Norm\Schema\NormString;
 

return array(
    'schema' => array(
        # I. ORGANISASI

        // Alamat Kantor
        'jalan' => NormString::create('jalan')->set('list-column', true),
        'kota' => NormString::create('kota')->set('list-column', true),
        'provinsi' => NormString::create('provinsi')->set('list-column', true),
        'kode_pos' => NormString::create('kode_pos')->set('list-column', true),

        'telepon' => NormString::create('telepon')->set('list-column', true),
        'faksimili' => NormString::create('faksimili')->set('list-column', true),
        'website_utama' => NormString::create('website_utama')->set('list-column', true),
        'website_jdih' => NormString::create('website_jdih')->set('list-column', true),
        'email' => NormString::create('email')->set('list-column', true),
        'sop_pengolahan_jdih' => FileUpload::create('sop_pengolahan_jdih')->set('list-column', true)->set('bucket','storage1'),

        # II. SUMBER DAYA MANUSIA (PADA BIDANG HUKUM / BIRO HUKUM)

        // Data Lengkap Kepala Bidang Hukum / Biro Hukum
        'nama_biro' => NormString::create('nama_biro')->set('list-column', true),
        'nip_biro' => NormString::create('nip_biro')->set('list-column', true),
        'pangkat_biro' => NormString::create('pangkat_biro')->set('list-column', true),
        'klasifikasi_pendidikan_biro' => NormString::create('klasifikasi_pendidikan_biro')->set('list-column', true),

        // Data Lengkap Kepala Subbidang
        'nama_sub' => NormString::create('nama_sub')->set('list-column', true),
        'nip_sub' => NormString::create('nip_sub')->set('list-column', true),
        'pangkat_sub' => NormString::create('pangkat_sub')->set('list-column', true),
        'klasifikasi_pendidikan_sub' => NormString::create('klasifikasi_pendidikan_sub')->set('list-column', true),

        // JFU Pengelola JDIH
        'nama_jfu' => NormString::create('nama_jfu')->set('list-column', true),
        'nip_jfu' => NormString::create('nip_jfu')->set('list-column', true),
        'pangkat_jfu' => NormString::create('pangkat_jfu')->set('list-column', true),
        'klasifikasi_pendidikan_jfu' => NormString::create('klasifikasi_pendidikan_jfu')->set('list-column', true),

        # III. KOLEKSI DI+OKUMEN HUKUM

        // Peraturan Perundang-undangan
        'undang_undang' => NormString::create('undang_undang')->set('list-column', true),
        'peraturan_pemerintah_pengganti_uu' => NormString::create('peraturan_pemerintah_pengganti_uu')->set('list-column', true),
        'peraturan_pemerintah' => NormString::create('peraturan_pemerintah')->set('list-column', true),
        'peraturan_presiden' => NormString::create('peraturan_presiden')->set('list-column', true),
        'peraturan_menteri' => NormString::create('peraturan_menteri')->set('list-column', true),
        'peraturan_daerah_provinsi' => NormString::create('peraturan_daerah_provinsi')->set('list-column', true),
        'peraturan_daerah_kabupaten' => NormString::create('peraturan_daerah_kabupaten')->set('list-column', true),
        'peraturan_daerah_kota' => NormString::create('peraturan_daerah_kota')->set('list-column', true),
        'peraturan_gubernur' => NormString::create('peraturan_gubernur')->set('list-column', true),
        'peraturan_bupati' => NormString::create('peraturan_bupati')->set('list-column', true),
        'peraturan_walikota' => NormString::create('peraturan_walikota')->set('list-column', true),

        'buku_hukum' => NormString::create('buku_hukum')->set('list-column', true),
        'jurnal_hukum' => NormString::create('jurnal_hukum')->set('list-column', true),
        'hasil_penelitian_hukum' => NormString::create('hasil_penelitian_hukum')->set('list-column', true),
        'hasil_pengkajian_hukum' => NormString::create('hasil_pengkajian_hukum')->set('list-column', true),
        'naskah_akademis' => NormString::create('naskah_akademis')->set('list-column', true),
        'rancangan_peraturan_daerah' => NormString::create('rancangan_peraturan_daerah')->set('list-column', true),
        'keputusan_pengadilan' => NormString::create('keputusan_pengadilan')->set('list-column', true),
        'yurispundensi' => NormString::create('yurispundensi')->set('list-column', true),
        'artikel_hukum' => NormString::create('artikel_hukum')->set('list-column', true),
        'kliping_koran_berita_hukum' => NormString::create('kliping_koran_berita_hukum')->set('list-column', true),
        'lain_lain' => NormString::create('lain_lain')->set('list-column', true),

        # IV. TEKNIS PENGOLAHAN

        // Sudah memiliki Pedoman Kerja (SOP) dalam pengelolaan JDIH
        'sudah_pedoman' => SelectTwoReference::create('sudah_pedoman')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_pedoman_jumlah' => NormString::create('sudah_pedoman_jumlah')->set('list-column', true),

        // Sudah memiliki daftar inventarisasi peraturan perundang-undangan dan instrumen hukum lainnya
        'sudah_iventarisasi' => SelectTwoReference::create('sudah_iventarisasi')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_iventarisasi_jumlah' => NormString::create('sudah_iventarisasi_jumlah')->set('list-column', true),

        //Sudah melakukan katalogisasi peraturan perundang-undangan dan instrumen hukum lainnya
        'sudah_katalogisasi' => SelectTwoReference::create('sudah_katalogisasi')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_katalogisasi_jumlah' => NormString::create('sudah_katalogisasi_jumlah')->set('list-column', true),

        // Sudah memiliki abstrak peraturan perundang-undangan
        'sudah_abstrak' => SelectTwoReference::create('sudah_abstrak')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_abstrak_jumlah' => NormString::create('sudah_abstrak_jumlah')->set('list-column', true),

        // Sudah memiliki indeks kliping Koran
        'sudah_indeks' => SelectTwoReference::create('sudah_indeks')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_indeks_jumlah' => NormString::create('sudah_indeks_jumlah')->set('list-column', true),

        // Sudah memiliki indeks majalah hukum
        'sudah_majalah' => SelectTwoReference::create('sudah_majalah')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_majalah_jumlah' => NormString::create('sudah_majalah_jumlah')->set('list-column', true),

        // Sudah memiliki katalogisasi monografi hukum
        'sudah_katalogisasi_hukum' => SelectTwoReference::create('sudah_katalogisasi_hukum')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        'sudah_katalogisasi_jumlah_hukum' => NormString::create('sudah_katalogisasi_jumlah_hukum')->set('list-column', true),

        # V. SARANA PRASARANA
        'ruang_kerja' => NormString::create('ruang_kerja')->set('list-column', true),
        'ruang_koleksi' => NormString::create('ruang_koleksi')->set('list-column', true),
        'ruang_baca' => NormString::create('ruang_baca')->set('list-column', true),
        'meja_baca' => NormString::create('meja_baca')->set('list-column', true),
        'kursi_baca' => NormString::create('kursi_baca')->set('list-column', true),
        'komputer' => NormString::create('komputer')->set('list-column', true),
        'printer' => NormString::create('printer')->set('list-column', true),
        'scanner' => NormString::create('scanner')->set('list-column', true),
        'koneksi_internet' => NormString::create('koneksi_internet')->set('list-column', true),
        'mesin_fotocopy' => NormString::create('mesin_fotocopy')->set('list-column', true),
        'writer' => NormString::create('writer')->set('list-column', true),
        'telepon_sarana' => NormString::create('telepon_sarana')->set('list-column', true),
        'fak' => NormString::create('fak', 'Faksimili')->set('list-column', true),
        'lain' => NormString::create('lain', 'Lain Lain')->set('list-column', true),

        # VI. PEMANFAATAN TEKNOLOGI INFORMASI DAN KOMUNIKASI

        // Telah melakukan otomasi dalam pengelolaan JDIH dan penyebarluasan produk peraturan dan dokumen hukum lainnya yang dikeluarkan oleh instansi masing-masing
        'telah_otomasi' => SelectTwoReference::create('telah_otomasi')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Memiliki permasalahan dan kendala yang dihadapi dalam pemanfaatan teknologi informasi dan komunikasi di instansi masing-masing
        'memiliki_permasalahan' => SelectTwoReference::create('memiliki_permasalahan')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Sudah memiliki situs JDIH dalam bentuk website yang sesuai dengan ketentuan
        'memiliki_situs' => SelectTwoReference::create('memiliki_situs')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Telah melakukan pemutakhiran data dan informasi hukum yang tersedia dalam website secara periodik
        'melakukan_pemutaakhiran' => SelectTwoReference::create('melakukan_pemutaakhiran')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Website yang dikelola berdiri sendiri atau masih tergabung dalam website instansi induk
        'web_dikelola' => SelectTwoReference::create('web_dikelola')->to(array('1' => 'website berdiri sendiri', '2' => 'masih tergabung website instansi induk'))->set('list-column', true),

        # VII. KEGIATAN PEMBINAAN DAN PENGEMBANGAN JDIHN YANG TELAH DILAKUKAN (untuk Tahun Anggaran yang dievaluasi)

        // Bimbingan Teknis JDIHN
        'jml_kegiatan_bimtek' => NormString::create('jml_kegiatan_bimtek')->set('list-column', true),
        'jml_peserta_bimtek' => NormString::create('jml_peserta_bimtek')->set('list-column', true),
        'ket_bimtek' => NormString::create('ket_bimtek')->set('list-column', true),
        // Sosialisasi JDIHN
        'jml_kegiatan_sos' => NormString::create('jml_kegiatan_sos')->set('list-column', true),
        'jml_peserta_sos' => NormString::create('jml_peserta_sos')->set('list-column', true),
        'ket_sos' => NormString::create('ket_sos')->set('list-column', true),
        // Monitoring dan Evaluasi JDIHN
        'jml_kegiatan_mon' => NormString::create('jml_kegiatan_mon')->set('list-column', true),
        'jml_peserta_mon' => NormString::create('jml_peserta_mon')->set('list-column', true),
        'ket_mon' => NormString::create('ket_mon')->set('list-column', true),
        // Koordinasi dan Konsultasi Pelaksanaan JDIHN
        'jml_kegiatan_koor' => NormString::create('jml_kegiatan_koor')->set('list-column', true),
        'jml_peserta_koor' => NormString::create('jml_peserta_koor')->set('list-column', true),
        'ket_koor' => NormString::create('ket_koor')->set('list-column', true),
        // Rapat Koordinasi
        'jml_kegiatan_rakor' => NormString::create('jml_kegiatan_rakor')->set('list-column', true),
        'jml_peserta_rakor' => NormString::create('jml_peserta_rakor')->set('list-column', true),
        'ket_rakor' => NormString::create('ket_rakor')->set('list-column', true),
        // Koordinasi dan Konsultasi ke Pusat JDIHN
        'jml_kegiatan_kons' => NormString::create('jml_kegiatan_kons')->set('list-column', true),
        'jml_peserta_kons' => NormString::create('jml_peserta_kons')->set('list-column', true),
        'ket_kons' => NormString::create('ket_kons')->set('list-column', true),
        // Mengikuti kegiatan JDIH yang dilaksanakan oleh Anggota JDIH Daerah
        'jml_kegiatan_mengikuti' => NormString::create('jml_kegiatan_mengikuti')->set('list-column', true),
        'jml_peserta_mengikuti' => NormString::create('jml_peserta_mengikuti')->set('list-column', true),
        'ket_mengikuti' => NormString::create('ket_mengikuti')->set('list-column', true),
        // Kerja sama JDIH dengan Jajaran Kemenkumham
        'jml_kegiatan_kerja' => NormString::create('jml_kegiatan_kerja')->set('list-column', true),
        'jml_peserta_kerja' => NormString::create('jml_peserta_kerja')->set('list-column', true),
        'ket_kerja' => NormString::create('ket_kerja')->set('list-column', true),
        // Kerja sama JDIH dengan Pemerintah Daerah / SKPD
        'jml_kegiatan_kerjasama' => NormString::create('jml_kegiatan_kerjasama')->set('list-column', true),
        'jml_peserta_kerjasama' => NormString::create('jml_peserta_kerjasama')->set('list-column', true),
        'ket_kerjasama' => NormString::create('ket_kerjasama')->set('list-column', true),
        // Kerja sama JDIH dengan Mitra luar
        'jml_kegiatan_mitra' => NormString::create('jml_kegiatan_mitra')->set('list-column', true),
        'jml_peserta_mitra' => NormString::create('jml_peserta_mitra')->set('list-column', true),
        'ket_mitra' => NormString::create('ket_mitra')->set('list-column', true),

        # VIII. MONITORING DAN EVALUASI JDIH DI DAERAH

        // Biro Hukum Provinsi…
        'pengelola_jdih_prov' => NormString::create('pengelola_jdih_prov')->set('list-column', true),
        'website_jdih_prov' => NormString::create('website_jdih_prov')->set('list-column', true),
        'status_integrasi_prov' => NormString::create('status_integrasi_prov')->set('list-column', true),
        // kabupaten
        'pengelola_jdih_kab' => NormString::create('pengelola_jdih_kab')->set('list-column', true),
        'website_jdih_kab' => NormString::create('website_jdih_kab')->set('list-column', true),
        'status_integrasi_kab' => NormString::create('status_integrasi_kab')->set('list-column', true),
        // kota
        'pengelola_jdih_kota' => NormString::create('pengelola_jdih_kota')->set('list-column', true),
        'website_jdih_kota' => NormString::create('website_jdih_kota')->set('list-column', true),
        'status_integrasi_kota' => NormString::create('status_integrasi_kota')->set('list-column', true),
        // Sekretaris Dewan Provinsi
        'pengelola_jdih_dewprov' => NormString::create('pengelola_jdih_dewprov')->set('list-column', true),
        'website_jdih_dewprov' => NormString::create('website_jdih_dewprov')->set('list-column', true),
        'status_integrasi_dewprov' => NormString::create('status_integrasi_dewprov')->set('list-column', true),
        // Sekretaris Dewan Kabupaten
        'pengelola_jdih_dewpkab' => NormString::create('pengelola_jdih_dewpkab')->set('list-column', true),
        'website_jdih_dewpkab' => NormString::create('website_jdih_dewpkab')->set('list-column', true),
        'status_integrasi_dewpkab' => NormString::create('status_integrasi_dewpkab')->set('list-column', true),
        // Perpustakaan Hukum Perguruan Tinggi Negeri
        'pengelola_jdih_negri' => NormString::create('pengelola_jdih_negri')->set('list-column', true),
        'website_jdih_negri' => NormString::create('website_jdih_negri')->set('list-column', true),
        'status_integrasi_negri' => NormString::create('status_integrasi_negri')->set('list-column', true),
        // Perpustakaan Hukum Perguruan Tinggi Swasta
        'pengelola_jdih_swasta' => NormString::create('pengelola_jdih_swasta')->set('list-column', true),
        'website_jdih_swasta' => NormString::create('website_jdih_swasta')->set('list-column', true),
        'status_integrasi_swasta' => NormString::create('status_integrasi_swasta')->set('list-column', true),

        # IX. PERMASALAHAN / KENDALA YANG DIHADAPI
        // Telah melakukan otomasi dalam pengelolaan JDIH dan penyebarluasan produk peraturan dan dokumen hukum lainnya yang dikeluarkan oleh instansi masing-masing
        'otomasi' => SelectTwoReference::create('otomasi')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Memiliki permasalahan dan kendala yang dihadapi dalam pemanfaatan teknologi informasi dan komunikasi di instansi masing-masing
        'permasalahan' => SelectTwoReference::create('permasalahan')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Sudah memiliki situs JDIH dalam bentuk website yang sesuai dengan ketentuan
        'situs_jdih' => SelectTwoReference::create('situs_jdih')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Telah melakukan pemutakhiran data dan informasi hukum yang tersedia dalam website secara periodik
        'pemutakhiran' => SelectTwoReference::create('pemutakhiran')->to(array('1' => 'Ya', '2' => 'Tidak'))->set('list-column', true),
        // Website yang dikelola berdiri sendiri atau masih tergabung dalam website instansi induk
        'web_yg_dikelola' => SelectTwoReference::create('web_yg_dikelola')->to(array('1' => 'website berdiri sendiri', '2' => 'masih tergabung website instansi induk'))->set('list-column', true),

        # X. SARAN
        'saran' => NormString::create('saran')->set('list-column', true),
        ),
);