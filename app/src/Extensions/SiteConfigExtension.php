<?php /** @noinspection PhpUnusedPrivateFieldInspection */

namespace App\Extensions;

use SilverStripe\Assets\File;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Assets\Image;

class SiteConfigExtension extends DataExtension
{

    private static $db = [
        'Address' => 'Text',
        'Address2' => 'Text',
        'City' => 'Text',
        'State' => 'Text',
        'Zip' => 'Text',
        'Country' => 'Text',
        'Phone' => 'Text',
        'TollFree' => 'Text',
        'Email' => 'Text',

        'Disclaimer' => 'Text',

        'Facebook' => 'Text',
        'Twitter' => 'Text',
        'Instagram' => 'Text',
        'YouTube' => 'Text',
        'Pinterest' => 'Text',
	    'LinkedIn' => 'Text',
    ];

    private static $has_one = [
        'SiteLogo' => File::class
    ];

    private static $owns = [
        'SiteLogo'
    ];

    public function updateCMSFields(FieldList $fields)
    {

        parent::updateCMSFields($fields);

        $fields->addFieldsToTab('Root.Main', [
            UploadField::create("SiteLogo", "Select image for the main logo in the header.")->setFolderName("SiteLogos"),
            HeaderField::create("MainLocationHeader", "Company Address"),
            TextField::create('Address', "Address"),
            TextField::create('Address2', "Address line 2"),
            TextField::create('City', "City"),
            TextField::create('State', "State"),
            TextField::create('Zip', "Zip"),
            TextField::create('Country', "Country"),
            TextField::create('Phone', "Main Line"),
            TextField::create('TollFree', "Toll-Free Line"),
            EmailField::create('Email', "Email"),
            TextareaField::create('Disclaimer', "Site-wide disclaimer that displays in the footer (optional)."),
        ]);

        $fields->addFieldsToTab('Root.SocialMedia', [
            HeaderField::create('Instructions', "Paste links to any applicable social media pages."),
            TextField::create('Facebook', "Link to Facebook (must include https://)"),
            TextField::create('Twitter', "Link to Twitter (must include https://)"),
            TextField::create('Instagram', "Link to Instagram (must include https://)"),
            TextField::create('YouTube', "Link to YouTube (must include https://)"),
            TextField::create('Pinterest', "Link to Pinterest (must include https://)"),
            TextField::create('LinkedIn', "Link to LinkedIn (must include https://)")
        ]);

    }

    public function getRelativePath($field)
    {
        $url = $this->owner->$field;
        return substr($url, strrpos($url, '/') + 1);
    }


}