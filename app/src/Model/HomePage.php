<?php

namespace App\Model;

use Page;

/**
 * HomePage pagetype class is used for the root page of the site.
 */
class HomePage extends Page {

	private static $table_name = 'HomePage';

	private static $db = [
	];

	private static $has_one = [
	];

	private static $many_many = [
	];

    private static $owns = [
    ];

    private static $many_many_extraFields = [
    ];

	private static $icon_class = 'font-icon-p-home';

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

	    return $fields;
    }

}