<?php

namespace App\Schema;

use Norm\Norm;
use Norm\Model;
use Norm\Schema\ReferenceArray;
use Bono\App;

class Checkbox extends ReferenceArray
{
    public function formatInput($value, $entry = null)
    {
        return $this->render('_schema/checkbox/input', array(
            'self' => $this,
            'value' => $value,
            'entry' => $entry,
        ));
    }

    public function formatReadonly($value, $entry = null)
    {
        $data = array();

        if (!empty($value->toArray())) {
            $data = $value->toArray();
        }

        $existing = '';
        $existing = "<span class=\"field\">\n";
        foreach ($data as $key => $value) {
            if ($value == 0) {
                $existing .= '<code>All</code>';
            } else {
                $text = SysparamReference::create('Tipe Dokumen')->setGroups('Tipe Dokumen')->format('plain', $value);
                $existing .= '<code>' . $text . '</code>';
            }
        }
        $existing .= "</span>\n";

        return $existing;
    }

    public function formatPlain($value, $entry = null)
    {
        $data = array();

        if (!empty($value->toArray())) {
            $data = $value->toArray();
        }

        $existing = '';
        foreach ($data as $key => $value) {
            if ($value == 0) {
                $existing .= '<code style="background-color: #f9f2f4; color: #c7254e;">All</code>';
            } else {
                $text = SysparamReference::create('Tipe Dokumen')->setGroups('Tipe Dokumen')->format('plain', $value);
                $existing .= '<code style="background-color: #f9f2f4; color: #c7254e;">' . $text . '</code>';
            }
        }

        echo $existing;
    }
}
