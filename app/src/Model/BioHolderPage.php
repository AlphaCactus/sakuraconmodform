<?php

namespace App\Model;

use Page;

class BioHolderPage extends Page {

    private static $table_name = 'BioHolderPage';
    private static $icon_class = 'font-icon-p-articles';

    private static $db = [
    ];

    private static $many_many = [
	];

    private static $many_many_extraFields = [
    ];

    private static $allowed_children = [
        BioPage::class
    ];

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		return $fields;
	}

}