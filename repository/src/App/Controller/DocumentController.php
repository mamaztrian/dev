<?php

namespace App\Controller;

use Norm\Norm;

class DocumentController extends AppController
{
    public function mapRoute()
    {
        $this->map('/upload_document', 'uploadDocument')->via('GET', 'POST');
        $this->map('/get_meta', 'getMeta')->via('GET');

        parent::mapRoute();
    }

    public function getSort()
    {
        $sort = array(
            'tahun_terbit' => -1,
            'nomor_peraturan' => -1
        );

        return $sort;
    }

    public function getMeta()
    {
        $id = $_GET['q'];

        $meta['meta'] = $this->generateMeta($id);
        $meta['group'] = $id;

        echo json_encode($meta);
        exit;
    }

    public function generateMeta($id)
    {
        $data_meta = array(
            1 => array(
                'tipe_dokumen',
                'jenis_peraturan',
                'judul',
                'nomor_peraturan',
                'tahun_terbit',
                'singkatan_bentuk',
                'tempat_terbit',
                'tanggal_penetapan',
                'sumber',
                'bahasa',
                'bidang_hukum',
            ),
            2 => array(
                'tipe_dokumen',
                'jenis_peraturan',
                'judul',
                'nomor_panggil',
                'edisi',
                'tempat_terbit',
                'penerbit',
                'deskripsi_fisik',
                'isbn',
                'bahasa',
                'nomor_induk_buku',
                'tahun_terbit',
                'tanggal_dibacakan',
                'pernyataan_tanggung_jawab',
                'info_detil_spesifik',
                'pola_nomor_eksemplar',
                'jumlah_eksemplar',
                'tipe_koleksi_nomor_eksemplar',
                'gmd',
                'kala_terbit',
                'judul_seri',
                'klasifikasi',
                'abstrak',
                'gambar_sampul',
                'sembunyikan_di_opac',
                'promosikan_ke_beranda',
                'label',
            ),
            3 => array(
                'tipe_dokumen',
                'judul',
                'tahun_terbit',
                'sumber',
                'bahasa',
                'bidang_hukum',
            ),
            4 => array(
                'tipe_dokumen',
                'judul',
                'nomor_peraturan',
                'jenis_peraturan',
                'singkatan_bentuk',
                'tempat_terbit',
                'tanggal_penetapan',
                'sumber',
                'bahasa',
                'bidang_hukum',
            )
        );

        if (isset($data_meta[$id])) {
            return $data_meta[$id];
        } else {
            return array();
        }
    }

    public function create()
    {
        $entry = $this->collection->newInstance()->set($this->getCriteria());
        $this->data['entry'] = $entry;

        /* Kirim semua data depedensi yang dibutuhkan agar bisa di panggil oleh view */
        $this->getDepedency();

        if ($this->request->isPost()) {
            try {
                $post = $this->request->getBody();

                $result = $entry->set($post)->save();

                h('notification.info', $this->clazz.' created.');

                h('controller.create.success', array(
                    'model' => $entry
                ));
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                // no more set notification.error since notificationmiddleware will
                // write this later
                // h('notification.error', $e);

                h('controller.create.error', array(
                    'model' => $entry,
                    'error' => $e,
                ));

                // rethrow error to make sure notificationmiddleware know what todo
                throw $e;
            }
        }
    }

    public function update($id)
    {
        try {
            $entry = $this->collection->findOne($id);
        } catch (Exception $e) {
            // noop
        }

        if (is_null($entry)) {
            return $this->app->notFound();
        }

        if ($this->request->isPost() || $this->request->isPut()) {
            try {
                $merged = array_merge(
                    isset($entry) ? $entry->dump() : array(),
                    $this->request->getBody() ?: array()
                );

                $entry->set($merged)->save();

                h('notification.info', $this->clazz.' updated');

                h('controller.update.success', array(
                    'model' => $entry,
                ));
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('notification.error', $e);

                if (empty($entry)) {
                    $model = null;
                }

                h('controller.update.error', array(
                    'error' => $e,
                    'model' => $entry,
                ));
            }
        }

        $this->data['entry'] = $entry;

        /* Kirim semua data depedensi yang dibutuhkan agar bisa di panggil oleh view */
        $this->getDepedency();
        $this->getExistingDepedency($id);
    }

    public function read($id)
    {
        $found = false;

        try {
            $this->data['entry'] = $entry = $this->collection->findOne($id);

            /* Kirim semua data depedensi yang dibutuhkan agar bisa di panggil oleh view */
            $this->getDepedency();
            $this->getExistingDepedency($id);
        } catch (Exception $e) {
            // noop
        }

        if (isset($entry)) {
            $found = true;
        }

        if (! $found) {
            return $this->app->notFound();
        }
    }

    public function getDepedency()
    {
        $pengarang = Norm::factory('Pengarang')->find()->sort(array('name' => 1));
        $this->data['data_pengarang'] = $pengarang;

        $penerbit = Norm::factory('Penerbit')->find()->sort(array('name' => 1));
        $this->data['data_penerbit'] = $penerbit;

        $tipe_pengarang = Norm::factory('TipePengarang')->find()->sort(array('orders' => 1));
        $this->data['data_tipe_pengarang'] = $tipe_pengarang;

        $jenis_pengarang = Norm::factory('JenisPengarang')->find()->sort(array('orders' => 1));
        $this->data['data_jenis_pengarang'] = $jenis_pengarang;

        $tipe_kata_kunci = Norm::factory('TipeKataKunci')->find()->sort(array('orders' => 1));
        $this->data['data_tipe_kata_kunci'] = $tipe_kata_kunci;

        $sql = 'SELECT DISTINCT(subyek) FROM data_subyek ORDER BY subyek';
        $statement = Norm::getConnection('mysql')->getRaw()->prepare($sql);
        $statement->execute();
        $subyek = $statement->fetchAll(\PDO::FETCH_ASSOC);
        $this->data['data_subyek'] = $subyek;
    }

    public function getExistingDepedency($id)
    {
        $existing_pengarang = Norm::factory('DataPengarang')->find(array('id_dokumen' => $id));
        $this->data['existing_pengarang'] = $existing_pengarang;

        $existing_subyek = Norm::factory('DataSubyek')->find(array('id_dokumen' => $id));
        $this->data['existing_subyek'] = $existing_subyek;

        $existing_lampiran = Norm::factory('DataLampiran')->find(array('id_dokumen' => $id));
        $this->data['existing_lampiran'] = $existing_lampiran;

        $existing_status = Norm::factory('DataStatus')->find(array('id_dokumen' => $id));
        $this->data['existing_status'] = $existing_status;
    }

    public function uploadDocument()
    {
        $path = dirname(dirname(dirname(__DIR__))) . '/www/storage/document/';

        if (!file_exists($path)) {
            mkdir($path, 0766, true);
        }

        foreach ($_FILES as $k => $value) {
            $tmp_file = $value['tmp_name'];
            $mimetype = $value['type'];
            $filename = $value['name'];
            $extension = explode('.', $filename);
            // $randomfile = md5($filename.rand(1, 99999).time()).'.'.$extension[count($extension)-1];
            $randomfile = $filename;

            if (move_uploaded_file($tmp_file, $path . $randomfile)) {
                $uploaded = array(
                    'status' => 'success',
                    'realname' => $filename,
                    'filename' => $randomfile,
                    'mime_type' => $mimetype
                );
            } else {
                $uploaded = array(
                    'status' => 'failed',
                    'realname' => $filename,
                    'filename' => $randomfile,
                    'mime_type' => $mimetype
                );
            }
        }

        echo json_encode($uploaded);
        exit;
    }
}
