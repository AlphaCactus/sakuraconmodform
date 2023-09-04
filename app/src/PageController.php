<?php

namespace {

    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\UserForms\Model\UserDefinedForm;
    use SilverStripe\View\Requirements;
    use SilverStripe\Dev\Debug;

    class PageController extends ContentController
    {

        protected function init()
        {
            parent::init();

	        $cssfiles = [
		        'public/css/layout.css'
	        ];
            Requirements::combine_files("pagecss.css", $cssfiles);

            //Userforms wants to load its own jQuery, which messes with our navigation JavaScript, so we block it here.
            //if($this->ClassName == UserDefinedForm::class){
                Requirements::block('//code.jquery.com/jquery-3.3.1.min.js');
            //}

            Requirements::javascript('https://code.jquery.com/jquery-1.12.1.min.js');

                $jscripts = [
		        'public/javascript/bootstrap.bundle.min.js',
                'public/javascript/hoverIntent.js',
                'public/javascript/superfish.min.js',
		        'public/javascript/script.js'
	        ];
	        Requirements::combine_files('pagejs.js', $jscripts);
        }
    }
}