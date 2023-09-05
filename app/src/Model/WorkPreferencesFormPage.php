<?php

namespace App\Model;

use Page;
use SilverStripe\Forms\HeaderField;


class WorkPreferencesFormPage extends Page
{
	private static $table_name = 'WorkPrefsFormPage';
	private static $description = 'Form for asking panel mods their work preferences';
    private static $icon_class = 'font-icon-p-package';

	private static $defaults = [
	];

    public function getCMSFields() {
        $fields = parent::getCMSFields();
        $fields->removeByName('Content');
        $fields->removeByName('Metadata');
        $fields->removeByName('MetaTitle');
        $fields->addFieldToTab('Root.Main', HeaderField::create('PageInfo', "This page is used to hold other pages."));
        return $fields;
    }
}