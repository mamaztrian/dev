<?php

namespace App\Provider;

use Norm\Norm;

class CheatProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;

        /*
            Cheat untuk generate data kategori dari database production

            8  => Peraturan perundang - undangan
            10 => Putusan pengadilan
        */
        // $app->get('/data_kategori', function () use ($app) {
        //     // $data = $this->getData(1);
        //     $data = $this->getData(8);

        //     // $this->saveCategory($data);

        //     exit;
        // });

        // $app->get('/data_uud', function () use ($app) {
        //     $connection = Norm::getConnection('mysql')->getRaw();

        //     $statement = $connection->prepare("SELECT count(*) count FROM tbl_uud");
        //     $statement->execute();
        //     $count = $statement->fetch(\PDO::FETCH_ASSOC);
        //     $count = $count['count'];
        //     $limit = 10;
        //     $offset = 11500;

        //     do {
        //         $statement = $connection->prepare("
        //             SELECT
        //                 d.id jenis_peraturan,
        //                 t.judul,
        //                 t.no_peraturan nomor_peraturan,
        //                 t.tahun tahun_terbit
        //             FROM tbl_uud t
        //             LEFT JOIN document_type d ON t.id_kategori = d.id_kategori
        //             LIMIT 10
        //             OFFSET ".$offset."
        //         ");

        //         $statement->execute();
        //         $data_uud = $statement->fetchAll(\PDO::FETCH_ASSOC);
        //         $offset += 10;

        //         foreach ($data_uud as $uud) {
        //             $uud['tipe_dokumen'] = 1;
        //             $model = Norm::factory('Document')->newInstance();
        //             $model->set($uud)->save(array('filter' => false, 'observer' => false));
        //         }
        //     } while ($offset < 12000);


        //     exit;
        // });

        // $app->get('/testing', function () use ($app) {
        //     $data = $this->getData(0);
        //     $data = $this->loopingData($data);

        //     echo '<pre>';
        //     print_r($data);
        //     exit;

        //     exit;
        // });
    }

    // public function loopingData($data)
    // {
    //     foreach ($data as $key => $value) {
    //         $results = $this->getData($value['id']);

    //         echo '<pre>';
    //         print_r($results);

    //         // if ($results) {
    //         //     $data[] = $results;
    //         //     $this->loopingData($results);
    //         // }
    //     }
    //     exit;

    //     return $data;
    // }

    // public function getData($id)
    // {
    //     $connection = Norm::getConnection('mysql')->getRaw();
    //     $statement = $connection->prepare("SELECT * FROM document_type WHERE parent_id = ?");
    //     $statement->execute(array($id));
    //     $results = $statement->fetchAll(\PDO::FETCH_ASSOC);

    //     return $results;
    // }

    // public function saveCategory($data)
    // {
    //     foreach ($data as $key => $value) {
    //         $save_data = array(
    //             'parent_id' => ($value['id_parent'] == 8) ? 1 : $value['id_parent'],
    //             'name' => $value['nama_kategori'],
    //             'id_kategori' => $value['id_kategori']
    //         );

    //         $a = Norm::factory('DocumentType')->newInstance();
    //         $a->set($save_data)->save();

    //         if (!empty($value['child'])) {
    //             /* SATU */
    //             foreach ($value['child'] as $layer1) {
    //                 $save_data1 = array(
    //                     'parent_id' => $a['$id'],
    //                     'name' => $layer1['nama_kategori'],
    //                     'id_kategori' => $layer1['id_kategori']
    //                 );

    //                 $b = Norm::factory('DocumentType')->newInstance();
    //                 $b->set($save_data1)->save();

    //                 if (!empty($layer1['child'])) {
    //                     /* DUA */
    //                     foreach ($layer1['child'] as $layer2) {
    //                         $save_data2 = array(
    //                             'parent_id' => $b['$id'],
    //                             'name' => $layer2['nama_kategori'],
    //                             'id_kategori' => $layer2['id_kategori']
    //                         );

    //                         $c = Norm::factory('DocumentType')->newInstance();
    //                         $c->set($save_data2)->save();

    //                         if (!empty($layer2['child'])) {
    //                             /* TIGA */
    //                             foreach ($layer2['child'] as $layer3) {
    //                                 $save_data3 = array(
    //                                     'parent_id' => $c['$id'],
    //                                     'name' => $layer3['nama_kategori'],
    //                                     'id_kategori' => $layer3['id_kategori']
    //                                 );

    //                                 $d = Norm::factory('DocumentType')->newInstance();
    //                                 $d->set($save_data3)->save();
    //                             }
    //                         }
    //                     }
    //                 }
    //             }
    //         }
    //     }

    //     exit;
    // }

    public function getData($parent_id)
    {
        $data = $this->executeQuery($parent_id);

        if ($data) {
            foreach ($data as $key => $value) {
                $data[$key]['child'] = $this->getData($value['id_kategori']);
                // $data[$key]['child'] = $this->getData($value['id']);
            }
        }

        return $data;
    }

    public function executeQuery($id)
    {
        $connection = Norm::getConnection('database_jdih')->getRaw();
        // $connection = Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare("SELECT * FROM tbl_kategori WHERE id_parent = ?");
        // $statement = $connection->prepare("SELECT * FROM document_type WHERE parent_id = ?");

        $statement->execute(array($id));
        $results = $statement->fetchAll(\PDO::FETCH_ASSOC);

        return $results;
    }
}
