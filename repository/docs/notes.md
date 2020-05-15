# Meta Data

Tipe dokumen                    =>      Search Reference
Judul                           =>      String
Nomor Peraturan                 =>      String
Jenis Petaturan                 =>      Search Reference
Singkatan Bentuk                =>      String
Tempat Terbit                   =>      Search Reference
Tempat Penetapan                =>      Search Reference
Tanggal Penetapan               =>      Datepicker
Sumber                          =>      String
Bahasa                          =>      Search Reference
Bidang Hukum                    =>      Search Reference
Nomor Panggil                   =>      String
Edisi                           =>      String
Penerbit                        =>      Search Reference
Tahun Terbit                    =>      String
Deskripsi Fisik                 =>      String
ISBN/ISSN                       =>      String
Nomor Putusan                   =>      String
Tanggal Dibacakan               =>      Datepicker

Pernyataan tanggung Jawab       =>      String
Info Detail Spesifik            =>      Textarea
Pola Nomor Eksemplar            =>      String
Jumlah Eksemplar                =>      Integer
Tipe Koleksi Nomor Eksemplar    =>      Search Reference
GMD                             =>      Search Reference
Kala Terbit                     =>      Search Reference
Judul Seri                      =>      String
Klasifikasi                     =>      Search Reference
Abstrak / Catatan               =>      Textarea
Gambar Sampul                   =>      Uploader
Sembunyikan di OPAC             =>      Radio Button
Promosikan Ke Beranda           =>      Radio Button
Label                           =>      Checkbox

Pengarang                       =>      Multi Data (Popup)
Subyek                          =>      Multi Data (Popup)
Lampiran Berkas                 =>      Multi Data (Popup)
Status Peraturan                =>      Multi Data (Popup)






SELECT 
    doc.tipe_dokumen,
    doc.judul,
    doc.nomor_peraturan,
    doc.nomor_panggil,
    doc.tempat_terbit,
    doc.tanggal_penetapan,
    doc.deskripsi_fisik,
    doc.sumber,
    doc.isbn,
    doc.bahasa,
    doc.jenis_peraturan,
    doc.singkatan_bentuk,
    doc.tipe_koleksi_nomor_eksemplar,
    doc.pola_nomor_eksemplar,
    doc.jumlah_eksemplar,
    doc.kala_terbit,
    doc.tahun_terbit,
    doc.tanggal_dibacakan,
    doc.pernyataan_tanggung_jawab,
    doc.edisi,
    doc.gmd,
    doc.judul_seri,
    doc.klasifikasi,
    doc.info_detil_spesifik,
    doc.abstrak,
    doc.gambar_sampul,
    doc.label,
    doc.sembunyikan_di_opac,
    doc.promosikan_ke_beranda
FROM document doc




SELECT 
    doctype.name tipe_dokumen,
    doc.judul,
    doc.nomor_peraturan,
    doc.nomor_panggil,
    tp.name tempat_terbit,
    doc.tanggal_penetapan,
    doc.deskripsi_fisik,
    doc.sumber,
    doc.isbn,
    doc.bahasa,
    doc.jenis_peraturan,
    doc.singkatan_bentuk,
    tk.name tipe_koleksi_nomor_eksemplar,
    doc.pola_nomor_eksemplar,
    doc.jumlah_eksemplar,
    kt.name kala_terbit,
    doc.tahun_terbit,
    doc.tanggal_dibacakan,
    doc.pernyataan_tanggung_jawab,
    doc.edisi,
    doc.gmd,
    doc.judul_seri,
    k.name klasifikasi,
    doc.info_detil_spesifik,
    doc.abstrak,
    doc.gambar_sampul,
    doc.label,
    doc.sembunyikan_di_opac,
    doc.promosikan_ke_beranda
FROM document doc
LEFT JOIN document_type doctype ON doc.tipe_dokumen = doctype.id
LEFT JOIN tempat_penetapan tp ON doc.tempat_terbit = tp.id
LEFT JOIN tipe_koleksi tk ON doc.tipe_koleksi_nomor_eksemplar = tk.id
LEFT JOIN kala_terbit kt ON doc.kala_terbit = kt.id
LEFT JOIN klasifikasi k ON doc.klasifikasi = k.id
WHERE
    doctype.name tipe_dokumen LIKE '%peraturan%' OR
    doc.judul LIKE '%peraturan%' OR
    doc.nomor_peraturan LIKE '%peraturan%' OR
    doc.nomor_panggil LIKE '%peraturan%' OR
    tp.name tempat_terbit LIKE '%peraturan%' OR
    doc.tanggal_penetapan LIKE '%peraturan%' OR
    doc.deskripsi_fisik LIKE '%peraturan%' OR
    doc.sumber LIKE '%peraturan%' OR
    doc.isbn LIKE '%peraturan%' OR
    doc.bahasa LIKE '%peraturan%' OR
    doc.jenis_peraturan LIKE '%peraturan%' OR
    doc.singkatan_bentuk LIKE '%peraturan%' OR
    tk.name tipe_koleksi_nomor_eksemplar LIKE '%peraturan%' OR
    doc.pola_nomor_eksemplar LIKE '%peraturan%' OR
    doc.jumlah_eksemplar LIKE '%peraturan%' OR
    kt.name kala_terbit LIKE '%peraturan%' OR
    doc.tahun_terbit LIKE '%peraturan%' OR
    doc.tanggal_dibacakan LIKE '%peraturan%' OR
    doc.pernyataan_tanggung_jawab LIKE '%peraturan%' OR
    doc.edisi LIKE '%peraturan%' OR
    doc.gmd LIKE '%peraturan%' OR
    doc.judul_seri LIKE '%peraturan%' OR
    k.name klasifikasi LIKE '%peraturan%' OR
    doc.info_detil_spesifik LIKE '%peraturan%' OR
    doc.abstrak LIKE '%peraturan%' OR
    doc.gambar_sampul LIKE '%peraturan%' OR
    doc.label LIKE '%peraturan%' OR
    doc.sembunyikan_di_opac LIKE '%peraturan%' OR
    doc.promosikan_ke_beranda LIKE '%peraturan%'

SELECT * 
FROM `doctype`
WHERE parent_id = 8

UPDATE `doctype` 
SET second_id = CONCAT('1:15:', id) 
WHERE parent_id = 15;




















