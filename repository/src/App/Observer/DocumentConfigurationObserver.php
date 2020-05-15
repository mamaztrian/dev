<?php

namespace App\Observer;

use Norm\Norm;
use Bono\App;

class DocumentConfigurationObserver
{
	public function saving($model)
	{
		$app = App::getInstance();
		$post = $app->request->post();

		if (!isset($post['document_type'])) {
			$model->set('document_type', '[]');
		}

		if ($model->isNew()) {
			$this->addColumn($model);
		} else {
			$this->editColumn($model);
		}
	}

	public function generateSqlAdd($model)
	{
		$field = $model->get('field_name');
		$type = $model->get('type');

		switch ($type) {
			case 'text':
				$sql = 'ALTER TABLE document ADD ' . $field . ' TEXT';
				break;

			case 'dropdown':
				$sql = 'ALTER TABLE document ADD ' . $field . ' TEXT';
				break;

			case 'date':
				$sql = 'ALTER TABLE document ADD ' . $field . ' DATE';
				break;

			default:
				$sql = 'ALTER TABLE document ADD ' . $field . ' VARCHAR(255)';
				break;
		}

		return $sql;
	}

	public function generateSqlUpdate($model)
	{
		$before = $model->previous();
		$after = $model->toArray();
		$type = $model->get('type');

		switch ($type) {
			case 'text':
				$sql = 'ALTER TABLE document CHANGE ' . $before['field_name'] . ' ' . $after['field_name'] . ' TEXT';
				break;

			case 'dropdown':
				$sql = 'ALTER TABLE document CHANGE ' . $before['field_name'] . ' ' . $after['field_name'] . ' TEXT';
				break;

			case 'date':
				$sql = 'ALTER TABLE document CHANGE ' . $before['field_name'] . ' ' . $after['field_name'] . ' DATE';
				break;

			default:
				$sql = 'ALTER TABLE document CHANGE ' . $before['field_name'] . ' ' . $after['field_name'] . ' VARCHAR(255)';
				break;
		}

		return $sql;
	}

	public function runSql($sql)
	{
		$statement = Norm::getConnection('mysql')->getRaw()->prepare($sql);
		$statement->execute();
	}

	public function addColumn($model)
	{
		$sql = $this->generateSqlAdd($model);
		$this->runSql($sql);
	}

	public function editColumn($model)
	{
		$sql = $this->generateSqlUpdate($model);
		$this->runSql($sql);
	}
}