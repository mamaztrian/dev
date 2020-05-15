<?php

namespace App\Library;

use Norm\Norm;
use Bono\Helper\URL;

class WordHelper
{
    public function limitText($text, $limit)
    {
        if (is_array($text)) {
            $text = implode('<br><br>', $text);
        }

        if (str_word_count($text, 0) > $limit) {
            $words = str_word_count($text, 2);
            $pos = array_keys($words);
            $text = substr($text, 0, $pos[$limit]) . '...';
        }

        return $text;
    }

    public function getLastStatus($id, $status_terakhir)
    {
        $connection = Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare("
            SELECT
                d.judul,
                dp.id_dokumen_target,
                dp.status_peraturan,
                dp.catatan_status_peraturan
            FROM data_status dp
            LEFT JOIN document d ON d.id = dp.id_dokumen_target
            WHERE dp.id_dokumen = ?
            ORDER BY tanggal_perubahan DESC
            LIMIT 1
        ");
        $statement->execute(array($id));
        $result = $statement->fetch(\PDO::FETCH_ASSOC);

        switch ($status_terakhir) {
            case 'diubah':
                $status_terakhir = 'Diubah oleh <a href="' . URL::site('admin/document/' . $result['id_dokumen_target']) . '">' . $result['judul'] . '</a>';
                break;

            case 'mengubah':
                $status_terakhir = 'Mengubah <a href="' . URL::site('admin/document/' . $result['id_dokumen_target']) . '">' . $result['judul'] . '</a>';
                break;

            case 'dicabut_sebagian':
                $status_terakhir = 'Dicabut sebagian oleh <a href="' . URL::site('admin/document/' . $result['id_dokumen_target']) . '">' . $result['judul'] . '</a>';
                break;

            case 'mencabut':
                $status_terakhir = 'Mencabut <a href="' . URL::site('admin/document/' . $result['id_dokumen_target']) . '">' . $result['judul'] . '</a>';
                break;

            case 'mencabut_sebagian':
                $status_terakhir = 'Mencabut sebagian <a href="' . URL::site('admin/document/' . $result['id_dokumen_target']) . '">' . $result['judul'] . '</a>';
                break;

            default:
                $status_terakhir = '';
                break;
        }

        return $status_terakhir;
    }

    public function multipleHighlightPhrase($str, $phrase, $tag_open = '<strong>', $tag_close = '</strong>')
    {
        if ($str == '') {
            return '';
        }

        if (!empty($phrase)) {
            $phrase = array_values($phrase);

            if (count($phrase) == 1) {
                $phrase = explode(' ', $phrase[0]);
            }

            $phrase = array_map(function ($v) {
                $v = preg_replace('/[^A-Za-z0-9\-\']/', '', $v);

                if (is_array($v)) {
                    unset($v);
                } else {
                    if (is_numeric($v)) {
                        $v = '\\b' . $v . '\\b';
                    }
                    return $v;
                }
            }, $phrase);

            $phrase = implode('|', array_filter($phrase));

            $replace = preg_replace_callback('/'.$phrase.'/i', function ($match) use ($tag_open, $tag_close) {
                return $tag_open . '' . preg_quote($match[0], '/') . '' . $tag_close;
            }, $str);

            return $replace;
        }

        return $str;
    }

    public function decEnc($action, $string)
    {
        $output = false;

        $encrypt_method = "AES-256-CBC";
        $secret_key = 'project hki';
        $secret_iv = 'project hki';

        // hash
        $key = hash('sha256', $secret_key);

        // iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
        $iv = substr(hash('sha256', $secret_iv), 0, 16);

        if ($action == 'encrypt') {
            $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
            $output = base64_encode($output);
        } else if ($action == 'decrypt') {
            $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
        }

        return $output;
    }
}
