<?php

namespace App\Controller;

use \Norm\Controller\NormController;
use Dompdf\Dompdf;
use \Picqer\Barcode\BarcodeGeneratorHTML;
use App\Library\HtmlExcel;

class MemberController extends AppController
{
    public function mapRoute()
    {
        parent::mapRoute();
        $this->map('/null/:id/print_kartu', 'printKartu')->via('GET', 'POST');
        $this->map('/null/export', 'export')->via('GET', 'POST');
        $this->map('/:id/circulation', 'circulation')->via('GET', 'POST');
    }

    public function circulation($id)
    {
        $found = false;

        $buku = \Norm::factory('Circulation')->newInstance()->set($this->getCriteria());

        $this->data['buku'] = $buku;


        try {
            $this->data['entry'] = $entry = $this->collection->findOne($id);
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

    public function printKartu($id)
    {
        $collection = \Norm::factory('Member')->findOne(array('id' => $id));
        $generator = new \Picqer\Barcode\BarcodeGeneratorHTML();
        $code = $generator->getBarcode($collection['$id'], $generator::TYPE_CODE_128, 1, 30);
        $dompdf = new Dompdf();
        $template = $this->app->theme->partial('kartu/kartu', array(
            'code' => $code,
        ));
        $dompdf->setPaper('A4', 'potrait');
        $dompdf->loadHtml($template);
        $dompdf->render();
        $dompdf->stream('kartu.pdf', array("Attachment" => false));
        exit;
    }

    public function export()
    {
        $collection = \Norm::factory('Member')->find();
        $template = $this->app->theme->partial('member/export', array(
            'collection' => $collection
        ));

        $xls = new HtmlExcel();
        // $xls->setCss($css);
        $xls->addSheet("Worksheet", $template);
        $xls->headers();
        echo $xls->buildFile();
        exit;
    }
}
