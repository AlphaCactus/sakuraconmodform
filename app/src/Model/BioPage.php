<?php

namespace App\Model;

use Page;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;

class BioPage extends Page {

    private static $table_name = 'BioPage';
    private static $icon_class = 'font-icon-p-profile';

    private static $db = [
        'Credentials' => 'Text',
        'JobTitle' => 'Text'
    ];

    private static $has_one = [
        'BioImage' => Image::class
    ];

    private static $owns = [
        'BioImage'
    ];

	public function getCMSFields() {
		$fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', TextField::create('Credentials', 'Credentials'), 'Content');
        $fields->addFieldToTab('Root.Main', TextField::create('JobTitle', 'Job Title'), 'Content');
        $fields->addFieldToTab('Root.Main', UploadField::create('BioImage', 'Bio Image')->setFolderName('Bio-Images'), 'Content');

		return $fields;
	}

}