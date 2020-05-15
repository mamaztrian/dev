<?php

use Norm\Schema\Stringz;
use Norm\Schema\Reference;
use Norm\Schema\Text;
use App\Schema\SysparamReference;
use App\Schema\Checkbox;

return array(
	'observers' => array(
		'App\\Observer\\DocumentConfigurationObserver' => null
	),
	'schema' => array(
		'ordering' => Stringz::create('ordering')->set('list-column', true),
		'field_name' => Stringz::create('field_name')->set('list-column', true),
		'label' => Stringz::create('label')->set('list-column', true),
		'type' => Reference::create('type')->to(array(
			'string' => 'String',
			'text' => 'Text',
			'date' => 'Date',
			'dropdown' => 'Dropdown',
		))->set('list-column', true),
		'data' => Reference::create('data', 'Referensi Data')->to(function($value = null){
			$statement = Norm::getConnection('mysql')->getRaw()->prepare('SELECT DISTINCT groups FROM sysparam ORDER BY groups ASC');
			$statement->execute();
			$results = $statement->fetchAll(\PDO::FETCH_ASSOC);

			$data = array();
			foreach ($results as $key => $result) {
				$data[$result['groups']] = $result['groups'];
			}

			if (!is_null($value)) {
				return $data[$value];
			}
			return $data;
		})->set('list-column', true),
		'is_active' => Reference::create('is_active')->to(array(
			1 => 'Yes',
			2 => 'No',
		))->set('list-column', true),
		'is_mandatory' => Reference::create('is_mandatory')->to(array(
			1 => 'Yes',
			2 => 'No',
		))->set('list-column', true),
		'document_type' => Checkbox::create('document_type')->to(function($value = null){
			$statement = Norm::getConnection('mysql')->getRaw()->prepare('SELECT * FROM sysparam WHERE groups = "Tipe Dokumen"');
			$statement->execute();
			$results = $statement->fetchAll(\PDO::FETCH_ASSOC);

			$data = array(0 => 'All');
			foreach ($results as $key => $result) {
				$data[$result['key']] = $result['value'];
			}

			if (!is_null($value)) {
				return $data[$value];
			}
			return $data;
		})->set('list-column', true),
	)
);
