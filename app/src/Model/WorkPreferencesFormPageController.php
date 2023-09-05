<?php

namespace App\Model;

use DateTime;
use PageController;
use SilverStripe\Forms\CompositeField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Forms\TextField;
use SilverStripe\View\Requirements;

class WorkPreferencesFormPageController extends PageController
{
    private static $allowed_actions = [
        'WorkPrefsForm',
    ];

    public static $positions = [
        "Panel Moderator" => "Panel Moderator",
    ];

    protected function init()
    {
        parent::init();

        Requirements::css("public/css/extra.css");
    }

    /**
     * @param DateTime $start
     * @param DateTime $end
     * @return array
     */
    public static function timesArray($start, $end)
    {
        $times = [];
        /** @var DateTime $cur */
        $cur = $start;
        $halfHourInterval = new \DateInterval("PT30M");
        while ($cur <= $end) {
            $str = $cur->format('g:i A');
            $times[$str] = $str;
            $cur->add($halfHourInterval);
        }
        return $times;
    }

    public function WorkPrefsForm()
    {
        $fields = FieldList::create(TextField::create('Name', 'Your Name'),
            DropdownField::create("Position", "Position", self::$positions),
            HeaderField::create("HeaderFriday", "Work Preferences"),
            LiteralField::create("Link", "https://codepen.io/masterys/pen/jOWwMJL")
        );

        // --------------------------------------------------
        // Friday
        $start = new DateTime("7:00");
        $end = new DateTime("23:30");
        $this->hourlySelectionFields($fields, "Friday", $start, $end);

        // --------------------------------------------------
        // Saturday
        $start = new DateTime("0:00");
        $end = new DateTime("23:30");
        $this->hourlySelectionFields($fields, "Saturday", $start, $end);

        // --------------------------------------------------
        // Sunday
        $start = new DateTime("0:00");
        $end = new DateTime("16:30");
        $this->hourlySelectionFields($fields, "Sunday", $start, $end);

        $actions = FieldList::create(FormAction::create('doWorkPrefs')->setTitle('Submit'));

        $required = RequiredFields::create('Name');

        $form = Form::create($this, __FUNCTION__, $fields, $actions, $required);

        return $form;
    }

    protected function hourlySelectionFields(&$fields, $dayName, $start, $end)
    {
        $times = self::timesArray($start, $end);

        // Display the work hours
        $fields->push(LiteralField::create("{$dayName}Hours", "$dayName: " .reset($times) . " to " . end($times)));

        $fPrefer = CheckboxSetField::create("{$dayName}Prefer", "Prefer", $times);
        $fPreferNot = CheckboxSetField::create("{$dayName}PreferNot", "PreferNot", $times);
        $fCannot = CheckboxSetField::create("{$dayName}Cannot", "Cannot", $times);

        $fields->push(CompositeField::create($fPrefer,$fPreferNot,$fCannot));
    }

    public function doWorkPrefs($data, Form $form)
    {
        $form->sessionMessage('Hello ' . $data['Name'], 'success');

        return $this->redirectBack();
    }
}