<?php

namespace App\Model;

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\CheckboxField;

class ContainerPage extends SiteTree
{
	private static $table_name = 'ContainerPage';
	private static $description = 'Page for holding other pages but cannot be linked to.';
    private static $icon_class = 'font-icon-p-package';

	private static $defaults = [
		'ShowInSearch' => 0
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