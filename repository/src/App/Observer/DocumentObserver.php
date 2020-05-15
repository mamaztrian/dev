<?php

namespace App\Observer;

use Norm\Norm;
use Bono\App;
use Bono\Helper\URL;

class DocumentObserver
{
    public function saving($model)
    {
        if (isset($model['data_pengarang'])) {
            $this->data_pengarang = $model['data_pengarang'];
            unset($model['data_pengarang']);
        }

        if (isset($model['data_subyek'])) {
            $this->data_subyek = $model['data_subyek'];
            unset($model['data_subyek']);
        }

        if (isset($model['data_lampiran'])) {
            $this->data_lampiran = $model['data_lampiran'];
            unset($model['data_lampiran']);
        }

        if (isset($model['data_status'])) {
            $this->data_status = $model['data_status'];
            unset($model['data_status']);
        }
    }

    public function saved($model)
    {
        $id = $model->getId();

        /* Menghapus semua data sesuai dengan parameter dokumen id pada tabel DataPengarang, DataSubyek, DataLampiran, DataStatus */
        $this->removeOldData($id);

        /* Save data pengarang */
        if (isset($this->data_pengarang)) {
            foreach ($this->data_pengarang as $pengarang) {
                $pengarang['id_dokumen'] = $id;

                if (!is_numeric($pengarang['nama_pengarang'])) {
                    $new_pengarang = Norm::factory('Pengarang')->newInstance();
                    $new_pengarang->set(array('name' => $pengarang['nama_pengarang']))->save();
                    $pengarang['nama_pengarang'] = $new_pengarang->getId();
                }

                $save_pengarang = Norm::factory('DataPengarang')->newInstance();
                $save_pengarang->set($pengarang)->save();
            }
        }

        /* Save data subyek */
        if (isset($this->data_subyek)) {
            foreach ($this->data_subyek as $subyek) {
                $subyek['id_dokumen'] = $id;

                $save_subyek = Norm::factory('DataSubyek')->newInstance();
                $save_subyek->set($subyek)->save();
            }
        }

        /* Save data lampiran */
        if (isset($this->data_lampiran)) {
            foreach ($this->data_lampiran as $lampiran) {
                $lampiran['id_dokumen'] = $id;

                $save_lampiran = Norm::factory('DataLampiran')->newInstance();
                $save_lampiran->set($lampiran)->save();
            }
        }

        /* Save data status */
        if (isset($this->data_status)) {
            /* Looping data status yang telah di input */
            foreach ($this->data_status as $data_perubahan_status) {
                /* Set id_dokumen */
                $data_perubahan_status['id_dokumen'] = $id;

                /* Pengecekan apakah tanggal perubah telah diisi atau belum, jika belum maka akan diisi dengan tanggal saat perubahan dilakukan */
                if (isset($data_perubahan_status['tanggal_perubahan']) && !is_null($data_perubahan_status['tanggal_perubahan'])) {
                    $data_perubahan_status['tanggal_perubahan'] = $data_perubahan_status['tanggal_perubahan'];
                } else {
                    $data_perubahan_status['tanggal_perubahan'] = date('Y-m-d h:i:s');
                }

                /* Melakukan pencarian data dokumen yang ingin diubah statusnya */
                $target = Norm::factory('Document')->findOne($data_perubahan_status['id_dokumen_target']);

                if ($target) {
                    /* Proses pengkondisian kebalikan status, jika dokumen melakukan action untuk "mencabut" sebuah dokumen, maka dokumen targetnya menjadi "dicabut" */
                    switch ($data_perubahan_status['status_peraturan']) {
                        case 'mencabut':
                            $status_for_target = 'dicabut';
                            break;
                        case 'mencabut_sebagian':
                            $status_for_target = 'dicabut_sebagian';
                            break;
                        case 'dicabut':
                            $status_for_target = 'mencabut';
                            break;
                        case 'dicabut_sebagian':
                            $status_for_target = 'mencabut_sebagian';
                            break;
                        case 'mengubah':
                            $status_for_target = 'diubah';
                            break;
                        case 'diubah':
                            $status_for_target = 'mengubah';
                            break;

                        default:
                            $status_for_target = '';
                            break;
                    }

                    $check = Norm::factory('DataStatus')->findOne(array(
                        'id_dokumen' => $target['$id'],
                        'status_peraturan' => $status_for_target,
                        'id_dokumen_target' => $id,
                    ));

                    if (!$check) {
                        $data_for_target = array(
                            'id_dokumen' => $target['$id'],
                            'status_peraturan' => $status_for_target,
                            'id_dokumen_target' => $id,
                            'catatan_status_peraturan' => $data_perubahan_status['catatan_status_peraturan'],
                            'tanggal_perubahan' => $data_perubahan_status['tanggal_perubahan'] ? $data_perubahan_status['tanggal_perubahan'] : date('Y-m-d h:i:s'),
                        );


                        $save_target = Norm::factory('DataStatus')->newInstance();
                        $save_target->set($data_for_target)->save();

                        $target->set(array('status_terakhir' => $status_for_target))->save(array('observer' => false, 'filter' => false));
                    }
                }

                $save_pelaku = Norm::factory('DataStatus')->newInstance();
                $save_pelaku->set($data_perubahan_status)->save();

                $model->set(array('status_terakhir' => $data_perubahan_status['status_peraturan']))->save(array('observer' => false, 'filter' => false));
            }
        }

        /* Create eksemplar */
        if (!empty($model['pola_nomor_eksemplar']) && !empty($model['jumlah_eksemplar'])) {
            $eksemplar = Norm::factory('PolaEksemplar')->findOne($model['pola_nomor_eksemplar']);
            $length = $eksemplar['length'];

            for ($i = 1; $i <= $model['jumlah_eksemplar']; $i++) {
                $sequence = str_pad($i, $length, '0', STR_PAD_LEFT);
                $item_code = $eksemplar['prefix'] . $sequence . $eksemplar['suffix'];
                $exist = Norm::factory('Item')->findOne(array('item_code' => $item_code));

                if (!$exist) {
                    $data = array(
                        'biblio_id' => $id,
                        'call_number' => $model['nomor_panggil'],
                        'item_code' => $item_code
                    );

                    $items = Norm::factory('Item')->newInstance();
                    $items->set($data)->save();
                }
            }
        }
    }

    public function removeOldData($id)
    {
        $collections = array('DataPengarang', 'DataSubyek', 'DataLampiran', 'DataStatus');

        foreach ($collections as $collection) {
            $data = Norm::factory($collection)->find(array('id_dokumen' => $id));

            foreach ($data as $model) {
                $model->remove();
            }
        }
    }
}
