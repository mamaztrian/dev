<?php

namespace App\Controller;

use \Norm\Controller\NormController;
use Dompdf\Dompdf;
use \Picqer\Barcode\BarcodeGeneratorHTML;
use App\Library\HtmlExcel;

class StockOpnameController extends AppController
{
    public function mapRoute()
    {
        parent::mapRoute();
        $this->map('/:id/stock', 'stock')->via('GET', 'POST');
        $this->map('/null/export', 'export')->via('GET', 'POST');
        $this->map('/:id/finish', 'finish')->via('GET', 'POST');
    }

    public function create()
    {
        $entry = $this->collection->newInstance()->set($this->getCriteria());

        $this->data['entry'] = $entry;

        if ($this->request->isPost()) {
            try {
                $post = $this->request->getBody();
                $entry->set($post);
                $entry->set('tanggal_dibuat', date('Y-m-d'));
                $entry->save();

                h('notification.info', $this->clazz.' created.');

                h('controller.create.success', array(
                    'model' => $entry
                ));

                $this->redirect(\Url::site('stock_opname'));
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

    public function delete($id)
    {
        $id = explode(',', $id);

        if ($this->request->isPost() || $this->request->isDelete()) {
            $single = false;
            if (count($id) === 1) {
                $single = true;
            }

            try {
                $this->data['entries'] = array();

                foreach ($id as $value) {
                    $model = $this->collection->findOne($value);

                    if (is_null($model)) {
                        if ($single) {
                            $this->app->notFound();
                        }

                        continue;
                    }

                    $model->remove();

                    $this->data['entries'][] = $model;
                }

                $datas = \Norm::factory('StockSearchResult')->find(array('id_stock_opname' => $id[0]));
                foreach ($datas as $key => $value) {
                    $value->remove();
                }

                h('notification.info', $this->clazz.' deleted.');

                h('controller.delete.success', array(
                    'models' => $this->data['entries'],
                ));
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('notification.error', $e);

                if (empty($model)) {
                    $model = null;
                }

                h('controller.delete.error', array(
                    'error' => $e,
                    'model' => $model,
                ));
            }
        }
    }

    public function stock($id)
    {
        $this->data['id'] = $id;

        if ($this->request->isPost()) {
            $ex = \Norm::factory('Item')->findOne(array('item_code' => $_POST['buku']));

            if ($ex) {
                $cek = \Norm::factory('StockSearchResult')->findOne(array('nomor_panggil_doc' => $_POST['buku']));
                if ($cek) {
                    h('notification.error', 'Hasil Pencarian '. $_POST['buku'] .' Sudah Ada');
                } else {
                    $result = \Norm::factory('StockSearchResult')->newInstance();
                    $result->set('id_stock_opname', $id);
                    $result->set('nomor_panggil_doc', $_POST['buku']);
                    $result->set('name', $ex['biblio_id']);
                    $result->save();
                }
            } else {
                h('notification.error', 'Hasil Pencarian '. $_POST['buku'] .' Tidak ditemukan');
            }
        }

        $data = \Norm::factory('StockSearchResult')->find(array('id_stock_opname' => $id));
        $this->data['data'] = $data;
    }

    public function finish($id)
    {
        $data = \Norm::factory('StockOpname')->findOne(array('id' => $id));
        $data->set('stok_status', 'finish');
        $data->set('tanggal_selesai', date('Y-m-d'));
        $data->save();

        h('notification.info', ' Stok Opname Berhasil');

        $this->redirect(\Url::site('stock_opname'));
    }
}
