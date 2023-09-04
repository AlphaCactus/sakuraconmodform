<?php

namespace App\Model;

use SilverStripe\CMS\Controllers\ContentController;

class ContainerPageController extends ContentController
{
    public function index()
    {
        if ($this->inCMSContext()) {
            return "This page is used to hold other pages.";
        }
        if ($this->Children()->count() > 0) {
            return $this->redirect($this->Children()->first()->Link());
        }
        return $this->redirect('/');
    }

    protected function inCMSContext()
    {
        return intval($this->request->getVar("CMSPreview")) === 1;
    }
}