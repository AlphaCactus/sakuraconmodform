<?php

namespace {
	
	use SilverStripe\CMS\Model\SiteTree;

    class Page extends SiteTree
    {
        private static $db = [
        ];

        private static $has_one = [
        ];

        private static $many_many = [
        ];

        private static $many_many_extraFields = [
        ];

        private static $owns = [
        ];

        public function getCMSFields()
        {
            $fields = parent::getCMSFields();

            return $fields;
        }

    }
}
