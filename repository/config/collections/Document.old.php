<?php

use Norm\Norm;
use Norm\Schema\Stringz;
use Norm\Schema\Text;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;

$statement = Norm::getConnection('mysql')->getRaw()->prepare('SELECT * FROM document_configuration ORDER BY ordering ASC');
$statement->execute();
$results = $statement->fetchAll(\PDO::FETCH_ASSOC);

$schemas = array();
foreach ($results as $result) {
	switch ($result['type']) {
		case 'text':
			if ($result['is_mandatory'] == 1) {
				$schema = Text::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type'])->filter('trim|required');;
			} else {
				$schema = Text::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type']);
			}
			break;

		case 'dropdown':
			if ($result['is_mandatory'] == 1) {
				$schema = SysparamReference::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->setGroups($result['data'])->filter('trim')->set('list-column', true)->set('document_type', $result['document_type'])->filter('trim|required');;
			} else {
				$schema = SysparamReference::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->setGroups($result['data'])->filter('trim')->set('list-column', true)->set('document_type', $result['document_type']);
			}
			break;

		case 'date':
			if ($result['is_mandatory'] == 1) {
				$schema = DatePicker::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type'])->filter('trim|required');;
			} else {
				$schema = DatePicker::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type']);
			}
			break;

		default:
			if ($result['is_mandatory'] == 1) {
				$schema = Stringz::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type'])->filter('trim|required');
			} else {
				$schema = Stringz::create($result['field_name'], $result['label'] ? $result['label'] : ucwords(str_replace('_', ' ', $result['field_name'])))->set('list-column', true)->set('document_type', $result['document_type']);
			}
			break;
	}

	if ($result['is_active'] == 1) {
		$schemas[$result['field_name']] = $schema;
	}
}

return array(
	'schema' => $schemas
);