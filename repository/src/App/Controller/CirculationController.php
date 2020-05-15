<?php

namespace App\Controller;

use Dompdf\Dompdf;
use App\Library\HtmlExcel;

class CirculationController extends AppController
{
    public function mapRoute()
    {
        parent::mapRoute();

        $this->map('', 'search')->via('GET', 'POST');
        $this->map('/null/:id/kembali', 'kembali')->via('GET', 'POST');
        $this->map('/null/:id/perpanjang', 'perpanjang')->via('GET', 'POST');
        $this->map('/null/exportPdf', 'exportPdf')->via('GET', 'POST');
        $this->map('/null/exportExcel', 'exportExcel')->via('GET', 'POST');
    }

    public function create()
    {
        $entry = $this->collection->newInstance()->set($this->getCriteria());

        $this->data['entry'] = $entry;

        if ($this->request->isPost()) {
            try {
                $post = $entry->set($this->request->getBody());

                $this->redirect('admin/member/'.$post['member_id'].'/circulation');

                $today = date('Y-m-d');
                $member = \Norm::factory('Member')->findOne(array('id' => $post['member_id']));
                $type = \Norm::factory('MstMemberType')->findOne(array('id' => $member['member_type_id']));
                $tgl_pjm = date('Y-m-d', strtotime('+'.$type['loan_limit'].' days', strtotime($today)));
                // $tgl_pjm = date("d/m/Y", mktime(0, 0, 0, date("m") , date("d")+$type['loan_limit'],date("Y")));
                $cek = \Norm::factory('Circulation')->findOne(array('member_id' => $post['member_id'], 'book_id' => $post['book_id']));

                if ($cek['status'] == 1 || $cek['status'] == 2) {
                    h('notification.error', ' ID ini sedang dalam peminjaman');
                } else {
                    $post->set('tanggal_pinjam', $today);
                    $post->set('tanggal_kembali', $tgl_pjm);
                    $post->set('status', '1');
                    $post->set('denda', '0');
                    $post->save();

                    h('notification.info', $this->clazz.' created.');

                    h('controller.create.success', array(
                        'model' => $entry
                    ));

                    $this->redirect('admin/circulation');
                }
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

    public function kembali($id)
    {
        $collection = \Norm::factory('Circulation')->findOne(array('id' => $id));

        $peminjam = \Norm::factory('Member')->findOne(array('id' => $collection['member_id']));
        $this->data['peminjam'] = $peminjam['member_name'];

        if ($this->request->isPost()) {
            try {
                $collection->set('tanggal_kembali', date('Y-m-d'));
                $collection->set('status', '3');
                $collection->save();

                h('notification.info', ' dikembalikan');
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('controller.create.error', array(
                    'model' => $collection,
                    'error' => $e,
                ));

                throw $e;
            }

            $this->redirect('admin/circulation');
        }
        // $collection->set('status', '3');
        // $collection->save();
        // h('notification.info', ' Buku telah dikembalikan');

        // $this->redirect(URL::site('circulation'));
        // echo "<pre>";
        // var_dump($collection['member_id']);
        // exit;
    }

    public function perpanjang($id)
    {
        $collection = \Norm::factory('Circulation')->findOne(array('id' => $id));

        $peminjam = \Norm::factory('Member')->findOne(array('id' => $collection['member_id']));
        $this->data['peminjam'] = $peminjam['member_name'];

        $type = \Norm::factory('MstMemberType')->findOne(array('id' => $peminjam['member_type_id']));

        if ($this->request->isPost()) {
            try {
                $perpanjangan = date('Y-m-d', strtotime('+'.$type['loan_limit'].' days', strtotime($collection['tanggal_kembali'])));

                $collection->set('tanggal_kembali', $perpanjangan);
                $collection->set('status', '2');
                $collection->save();

                h('notification.info', ' diperpanjang');
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('controller.create.error', array(
                    'model' => $collection,
                    'error' => $e,
                ));

                throw $e;
            }

            $this->redirect('admin/circulation');
        }
    }

    public function exportPdf()
    {
        $dompdf = new Dompdf();
        $template = $this->app->theme->partial('exports/exportpdf');
        $dompdf->setPaper('A4', 'potrait');
        $dompdf->loadHtml($template);
        $dompdf->render();
        $dompdf->stream('kartu.pdf', array("Attachment" => false));
        exit;
    }
}
