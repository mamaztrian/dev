<?php

namespace App\Provider;

use Norm\Norm;
use Bono\Helper\URL;

class WebProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;

        $app->get('/web', function () use ($app) {
            $app->response->template('web/index');
        });

        $app->get('/admin', function () use ($app) {
            $app->response->template('static/index');
        });

        $app->get('/', function () use ($app) {
            $app->response->template('web/index');
        });

        $app->get('/web/result', function () use ($app) {


            $results = array(
                'results' => array(),
                'count' => 0,
                'keywords' => array(),
            );

            $params = $app->request->get();
            $results = $this->searchProcess($params);

            $nama = Norm::factory('Judul')->findOne();

            $app->response->data('nama', $nama['nama']);
            $app->response->data('results', $results['results']);
            $app->response->data('count', $results['count']);
            $app->response->data('keywords', $results['keywords']);

            $app->response->template('web/result');
        });

        $app->get('/web/result/:id/detail', function ($id) use ($app) {
            $this->setEncoding();

            /* Main query */
            $connection = Norm::getConnection('mysql')->getRaw();
            $statement = $connection->prepare("
                SELECT
                    doc.id,
                    doc.tipe_dokumen tipe_dokumen_id,
                    doctype.name tipe_dokumen,
                    doc.judul,
                    doc.nomor_panggil,
                    doc.penerbit,
                    doc.nomor_induk_buku,
                    doc.status_terakhir,
                    doc.nomor_peraturan,
                    tp.name tempat_terbit,
                    doc.tanggal_penetapan,
                    doc.deskripsi_fisik,
                    doc.sumber,
                    doc.isbn,
                    doc.bahasa,
                    doc.jenis_peraturan,
                    doc.bidang_hukum,
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
                    doc.klasifikasi,
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
                WHERE doc.id = ?
            ");

            $statement->execute(array($id));
            $result = $statement->fetch(\PDO::FETCH_ASSOC);

            $schema = Norm::factory('Document')->newInstance()->schema();
            $data_lampiran = Norm::factory('DataLampiran')->find(array('id_dokumen' => $id));
            $data_status = Norm::factory('DataStatus')->find(array('id_dokumen' => $id))->sort(array('id' => -1));
            $data_pengarang = Norm::factory('DataPengarang')->find(array('id_dokumen' => $id));
            $data_subyek = Norm::factory('DataSubyek')->find(array('id_dokumen' => $id));
            $nama = Norm::factory('Judul')->findOne();

            $app->response->data('nama', $nama['nama']);
            $app->response->data('data_subyek', $data_subyek);
            $app->response->data('data_pengarang', $data_pengarang);
            $app->response->data('data_status', $data_status);
            $app->response->data('data_lampiran', $data_lampiran);
            $app->response->data('schema', $schema);
            $app->response->data('result', $result);
            $app->response->data('bahasa', array(1 => 'Indonesia', 2 => 'Inggris'));

            switch ($result['tipe_dokumen_id']) {
                case '1':
                    $app->response->template('web/detail1');
                    break;
                case '2':
                    $app->response->template('web/detail2');
                    break;
                case '3':
                    $app->response->template('web/detail3');
                    break;
                case '4':
                    $app->response->template('web/detail4');
                    break;

                default:
                    break;
            }
        });

        $app->get('/get_document_type_by_name', function () use ($app) {
            $params = $app->request->get();
            $results = $this->getDocTypeByName($params);

            echo json_encode($results);
            exit;
        });

        $app->get('/get_main_document_type', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['term'])) {
                $results = $this->getMainDocType($params['term']);
            } else {
                $results = $this->getMainDocType();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_nama_pengarang', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['term'])) {
                $results = $this->getNamaPengarang($params['term']);
            } else {
                $results = $this->getNamaPengarang();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_existing_pengarang', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['nama_pengarang'])) {
                $results = $this->getExistingPengarang($params['nama_pengarang']);
            } else {
                $results = array();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_existing_document_type', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['jenis_peraturan'])) {
                $results = $this->getExistingDocumentType($params['jenis_peraturan']);
            } else {
                $results = array();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_existing_main_document_type', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['tipe_dokumen'])) {
                $results = $this->getExistingDocumentType($params['tipe_dokumen']);
            } else {
                $results = array();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_document', function () use ($app) {
            $params = $app->request->get();

            if (isset($params['term'])) {
                $results = $this->getDocument($params['term']);
            } else {
                $results = $this->getDocument();
            }

            echo json_encode($results);
            exit;
        });

        $app->get('/get_count_document', function () use ($app) {
            $params = $app->request->get();
            $ids = array();
            $count = 0;

            if (isset($params['jenis_peraturan'])) {
                $parent = $this->rowsArray("SELECT * FROM document_type WHERE id = ?", array($params['jenis_peraturan']));
                $length = strlen($parent[0]['second_id']);
                $all_doctype = $this->rowsArray("SELECT id FROM document_type WHERE SUBSTR(second_id, 1, ". $length .") = '" . $parent[0]['second_id'] . "'");
                $ids = array_column($all_doctype, 'id');

                if ($ids) {
                    $ids = '(' . implode(',', $ids) . ')';
                    $sql = "SELECT count(*) count FROM document WHERE jenis_peraturan IN " . $ids;
                    $result = $this->rowArray($sql);
                    $count = $result['count'];
                }
            } else {
                $sql = "SELECT count(*) count FROM document";
                $result = $this->rowArray($sql);
                $count = $result['count'];
            }

            echo json_encode($count);
            exit;
        });

        $app->get('/get_count_documents', function () use ($app) {
            $results = array();
            for ($i=1; $i <= 4; $i++) {
                $parent = $this->rowArray("SELECT * FROM document_type WHERE id = ?", array($i));
                $length = strlen($parent['second_id']);
                $all_doctype = $this->rowsArray("SELECT id FROM document_type WHERE SUBSTR(second_id, 1, ". $length .") = '" . $parent['second_id'] . "'");
                $ids = array_column($all_doctype, 'id');

                if ($ids) {
                    $ids = '(' . implode(',', $ids) . ')';
                    $sql = "SELECT count(*) count FROM document WHERE jenis_peraturan IN " . $ids;
                    $count = $this->rowArray($sql);

                    $results[$i] = array(
                        'name' => $parent['name'],
                        'count' => $count['count'],
                    );
                }

                $childs = $this->rowsArray("SELECT * FROM document_type WHERE parent_id = ?", array($parent['id']));
                for ($j=0; $j < count($childs); $j++) {
                    $length = strlen($childs[$j]['second_id']);
                    $all_doctype = $this->rowsArray("SELECT id FROM document_type WHERE SUBSTR(second_id, 1, ". $length .") = '" . $childs[$j]['second_id'] . "'");
                    $ids = array_column($all_doctype, 'id');

                    if ($ids) {
                        $ids = '(' . implode(',', $ids) . ')';
                        $sql = "SELECT count(*) count FROM document WHERE jenis_peraturan IN " . $ids;
                        $count = $this->rowArray($sql);

                        $results[$i]['childs'][$j] = array(
                            'name' => $childs[$j]['name'],
                            'count' => $count['count'],
                        );
                    }
                }
            }

            echo json_encode($results);
            exit;
        });

        $app->post('/update_status_integrasi', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE document SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_dokumen_type', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE document_type SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_status', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE data_status SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_pengarang', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE data_pengarang SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_lampiran', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE data_lampiran SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_bidang_hukum', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE bidang_hukum SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });

        $app->post('/update_status_integrasi_subyek', function () use ($app) {
            $post = $app->request->post();

            if (isset($post['integrasi']) && isset($post['id'])) {
                $sql = 'UPDATE data_subyek SET integrasi = ' . $post['integrasi'] . ' WHERE id = ' . $post['id'];

                try {
                    $connection = Norm::getConnection('mysql')->getRaw();
                    $statement = $connection->query($sql);
                    $statement->execute();
                } catch (\Exception $e) {
                    echo 'failed';
                    exit;
                }

                echo 'success';
                exit;
            }

            echo 'failed';
            exit;
        });
    }

    public function setEncoding()
    {
        $connection = Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare("set names utf8");
        $statement->execute();
    }

    public function searchProcess($params)
    {
        $this->setEncoding();
        $select_count = "SELECT count(DISTINCT(doc.id)) count ";
        $select = "SELECT DISTINCT
                doc.id,
                doc.tipe_dokumen tipe_dokumen_id,
                doctype.name tipe_dokumen,
                doc.judul,
                doc.status_terakhir,
                doc.nomor_peraturan,
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
                doc.promosikan_ke_beranda ";

        $from = " FROM document doc ";

        $join = " LEFT JOIN document_type doctype ON doc.tipe_dokumen = doctype.id
        LEFT JOIN tempat_penetapan tp ON doc.tempat_terbit = tp.id
        LEFT JOIN tipe_koleksi tk ON doc.tipe_koleksi_nomor_eksemplar = tk.id
        LEFT JOIN kala_terbit kt ON doc.kala_terbit = kt.id
        LEFT JOIN klasifikasi k ON doc.klasifikasi = k.id
        LEFT JOIN data_subyek ds ON doc.id = ds.id_dokumen
        LEFT JOIN data_pengarang dp ON doc.id = dp.id_dokumen  ";

        $where = array();
        $param = array();
        $main_keyword = array();

        if (isset($params['skip'])) {
            $skip = $params['skip'];
        } else {
            $skip = 0;
        }

        $subyek = array();
        $param_subyek = array();

        if (isset($params['q']) && !empty($params['q'])) {
            $keywords = explode(' ', $params['q']);
            $judul = array();

            foreach ($keywords as $k => $keyword) {
                $keyword = $this->subsitution(trim($keyword));
                $main_keyword[] = $keyword;

                if (is_numeric($keyword)) {
                    $judul[] = 'doc.judul RLIKE ?';
                    $param[] = '[[:<:]]' . $keyword . '[[:>:]]';
                } else {
                    $judul[] = 'doc.judul LIKE ?';
                    $param[] = '%'.$keyword.'%';
                }

                $subyek[] = 'ds.subyek = ?';
                $param_subyek[] = $keyword;
            }

            $where[] = '(' . implode(' AND ', $judul) . ')';
        }

        if (isset($params['tipe_dokumen']) && !empty($params['tipe_dokumen'])) {
            $where[] = '(doc.tipe_dokumen = ?)';
            $param[] = $params['tipe_dokumen'];
        }

        if (isset($params['jenis_peraturan']) && !empty($params['jenis_peraturan'])) {
            $parent = $this->rowsArray("SELECT * FROM document_type WHERE id = ?", array($params['jenis_peraturan']));
            $length = strlen($parent[0]['second_id']);
            $all_doctype = $this->rowsArray("SELECT id FROM document_type WHERE SUBSTR(second_id, 1, ". $length .") = '" . $parent[0]['second_id'] . "'");
            $ids = array_column($all_doctype, 'id');

            if ($ids) {
                $ids = '(' . implode(',', $ids) . ')';
                $where[] = '(doc.jenis_peraturan IN ' . $ids . ')';
            } else {
                $where[] = '(doc.jenis_peraturan IN (' . $params['jenis_peraturan'] . '))';
            }
        }

        if (isset($params['nama_pengarang']) && !empty($params['nama_pengarang'])) {
            $where[] = '(dp.nama_pengarang = ?)';
            $param[] = $params['nama_pengarang'];
        }

        if (isset($params['nomor_peraturan']) && !empty($params['nomor_peraturan'])) {
            $nomor = array();

            foreach (explode(',', $params['nomor_peraturan']) as $np) {
                $nomor[] = 'doc.nomor_peraturan = ?';
                $param[] = $np;
            }

            $where[] = '(' . implode(' OR ', $nomor) . ')';
        }

        if (isset($params['tahun_terbit']) && !empty($params['tahun_terbit'])) {
            $params['tahun_terbit'] = explode(',', $params['tahun_terbit']);

            $tahun = array();
            foreach ($params['tahun_terbit'] as $tt) {
                $tahun[] = 'doc.tahun_terbit = ?';
                $param[] = $tt;
            }

            $where[] = '(' . implode(' OR ', $tahun) . ')';
        }

        if (isset($params['status_terakhir']) && !empty($params['status_terakhir'])) {
            $where[] = 'doc.status_terakhir IN ("' . implode('","', $params['status_terakhir']) . '")';
        }

        $wheres = '';
        if (!empty($where)) {
            if (!empty($subyek)) {
                $wheres = 'WHERE (' . implode(' AND ', $where) . ') OR (' . implode(' OR ', $subyek) . ') AND (doc.jenis_peraturan IS NOT NULL)';
                $param = array_merge($param, $param_subyek);
            } else {
                $wheres = 'WHERE (' . implode(' AND ', $where) . ') AND (doc.jenis_peraturan IS NOT NULL)';
            }
        }

        $skip = " LIMIT 10 OFFSET " . $skip;
        $order = " ORDER BY doc.tahun_terbit DESC, doc.nomor_peraturan DESC ";
        $sql = $select . $from . $join . $wheres . $order . $skip;

        $sql_count = $select_count . $from . $join . $wheres;
        // if (empty($wheres)) {
        //     $sql_count = $select_count . $from . $join . ' WHERE doc.jenis_peraturan IS NOT NULL';
        // } else {
        //     $sql_count = $select_count . $from . $join . $wheres;
        // }

        $results = $this->rowsArray($sql, $param);
        $count = $this->rowArray($sql_count, $param);

        return array(
            'results' => $results,
            'count' => $count,
            'keywords' => $main_keyword,
        );
    }

    private function subsitution($keyword)
    {
        $subsitution = array(
            'th' => 'tahun',
            'th.' => 'tahun',
            'thn' => 'tahun',
            'no' => 'nomor',
            'no.' => 'nomor',
            'ttg' => 'tentang',
            'jdih' => 'jaringan dokumentasi dan informasi hukum nasional',
            'jdihn' => 'jaringan dokumentasi dan informasi hukum nasional',
        );

        if (isset($subsitution[$keyword])) {
            return $subsitution[$keyword];
        } else {
            return $keyword;
        }
    }

    private function getDocTypeByName($params = array())
    {
        if (isset($params['type']) && !empty(trim($params['type']))) {
            $parent = $this->rowsArray("SELECT * FROM document_type WHERE id = ?", array($params['type']));
            $length = strlen($parent[0]['second_id']);
            $sql = "SELECT * FROM document_type WHERE name LIKE ? AND id NOT IN (1, 2, 3, 4) AND SUBSTR(second_id, 1, ". $length .") = '" . $parent[0]['second_id'] . "' LIMIT 10";
        } else {
            $sql = "SELECT * FROM document_type WHERE name LIKE ? AND id NOT IN (1, 2, 3, 4) ORDER BY second_id LIMIT 10";
        }

        if (!isset($params['term'])) {
            $params['term'] = '';
        }

        $results = $this->rowsArray($sql, array('%' . $params['term'] . '%'));

        foreach ($results as $key => $value) {
            $length = strlen($value['second_id']);
            $all_doctype = $this->rowsArray("SELECT id FROM document_type WHERE SUBSTR(second_id, 1, ". $length .") = '" . $value['second_id'] . "'");
            $ids = array_column($all_doctype, 'id');

            if ($ids) {
                $ids = '(' . implode(',', $ids) . ')';
                $where = 'jenis_peraturan IN ' . $ids;
            } else {
                $where = 'jenis_peraturan IN (' . $value['id'] . ')';
            }

            $sql = "SELECT count(*) count FROM document WHERE " . $where;
            $res = $this->rowArray($sql);
            $results[$key]['count'] = $res['count'];
        }

        return $results;
    }

    private function getMainDocType($param = '')
    {
        $sql = "SELECT * FROM document_type WHERE name LIKE ? AND id IN (1, 2, 3, 4)";
        $params = array('%' . $param . '%');
        $results = $this->rowsArray($sql, $params);

        foreach ($results as $key => $value) {
            $sql = "SELECT count(DISTINCT(id)) count FROM document WHERE tipe_dokumen = ? AND jenis_peraturan IS NOT NULL";
            $params = array($value['id']);
            $res = $this->rowArray($sql, $params);

            $results[$key]['count'] = $res['count'];
        }

        return $results;
    }

    private function getNamaPengarang($param = '')
    {
        $sql = "SELECT DISTINCT dp.nama_pengarang id, p.name FROM data_pengarang dp LEFT JOIN pengarang p ON dp.nama_pengarang = p.id WHERE p.name LIKE ? ORDER BY p.name ASC";
        $params = array('%' . $param . '%');
        $results = $this->rowsArray($sql, $params);

        return $results;
    }

    private function getExistingPengarang($param = array())
    {
        $sql = "SELECT DISTINCT dp.nama_pengarang id, p.name FROM data_pengarang dp LEFT JOIN pengarang p ON dp.nama_pengarang = p.id WHERE dp.nama_pengarang = ?";
        $params = array($param);
        $result = $this->rowArray($sql, $params);

        return $result;
    }

    private function getExistingDocumentType($param = array())
    {
        $sql = "SELECT * FROM document_type WHERE id = ?";
        $params = array($param);
        $result = $this->rowArray($sql, $params);

        return $result;
    }

    private function getDocument($param = '')
    {
        $sql = "SELECT * FROM document WHERE judul LIKE ? ORDER BY tahun_terbit DESC LIMIT 10";
        $params = array('%' . $param . '%');
        $results = $this->rowsArray($sql, $params);

        return $results;
    }

    public static function getStatus($id, $params)
    {
        if (!isset($params['q'])) {
            $params['q'] = '';
        }

        $data_status = Norm::factory('DataStatus')->find(array('id_dokumen' => $id))->sort(array('_created_time' => -1));

        $dom =  '<div class="result__content__item__desc"><ul>';

        foreach ($data_status as $key => $status) {
            $document = Norm::factory('Document')->findOne($status['id_dokumen_target']);
            $dom .= '<li><b>'.ucwords(str_replace('_', ' ', $status['status_peraturan'])).' </b><a target="_BLANK" href="'. URL::site('web/result/' . $status['id_dokumen_target']) .'/detail?q='. $params['q'] .'">'.$document['judul'].'</a></li>';
        }

        $dom .= '</ul></div>';

        echo $dom;
    }

    private function rowsArray($sql, $params = array())
    {
        $connection = Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare($sql);

        if (empty($params)) {
            $statement->execute();
        } else {
            $statement->execute($params);
        }

        $results = $statement->fetchAll(\PDO::FETCH_ASSOC);

        return $results;
    }

    private function rowArray($sql, $params = array())
    {
        $connection = Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare($sql);

        if (empty($params)) {
            $statement->execute();
        } else {
            $statement->execute($params);
        }

        $result = $statement->fetch(\PDO::FETCH_ASSOC);

        return $result;
    }
}
