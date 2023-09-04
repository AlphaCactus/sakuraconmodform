<?php

use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\ORM\Search\FulltextSearchable;
use SilverStripe\Security\PasswordValidator;
use SilverStripe\Security\Member;
use SilverStripe\Control\Director;

global $database;
// change this database name to the correct one for your project
$database = 'boilerplate';

FulltextSearchable::enable();

if (Director::isLive())
{
	Director::forceSSL();
	Director::forceWWW();
}

// remove PasswordValidator for SilverStripe 5.0
$validator = PasswordValidator::create();
// Settings are registered via Injector configuration - see passwords.yml in framework
Member::set_password_validator($validator);

/* HTML Editor config
--------------------------------------*/

/* https://docs.silverstripe.org/en/4/developer_guides/customising_the_admin_interface/typography/ */
$formats = [
    [
        'title' => 'Containers',
        'items' => [
            [
                'title'          => 'div',
                'block'          => 'div',
                'classes'        => 'callout',
                'wrapper'        => true,
                'merge_siblings' => false,
            ],
        ],
    ],
    [
        'title' => 'Videos',
        'items' => [
            [
                'title'          => 'Anamorphic Widescreen',
                'selector'       => 'p',
                'classes'        => 'iframe21by9',
                'wrapper'        => true,
                'merge_siblings' => true,
            ],
            [
                'title'          => 'Standard Widescreen',
                'selector'       => 'p',
                'classes'        => 'iframe16by9',
                'wrapper'        => true,
                'merge_siblings' => true,
            ],
            [
                'title'          => 'Traditional TV',
                'selector'       => 'p',
                'classes'        => 'iframe4by3',
                'wrapper'        => true,
                'merge_siblings' => true,
            ],
            [
                'title'          => 'Square',
                'selector'       => 'p',
                'classes'        => 'iframe1by1',
                'wrapper'        => true,
                'merge_siblings' => true,
            ],
        ],
    ],
];
TinyMCEConfig::get('cms')
    ->disablePlugins(['sslinkanchor'])
    ->enablePlugins('media')
    ->enablePlugins('hr')
    ->enablePlugins('fullscreen')
    ->setButtonsForLine(1,
        'formatselect', 'styleselect', 'removeformat', '|', 'bold', 'italic', 'bullist', 'numlist', 'superscript', 'subscript', '|', 'outdent', 'indent'
    )
    ->setButtonsForLine(2,
        'undo', 'redo', 'cut', 'copy', 'paste', 'pastetext', '|', 'table', 'blockquote', 'hr', 'media', 'ssmedia', 'sslink', 'unlink', 'code', 'fullscreen'
    )
    ->setOptions([
        'media_live_embeds' => false,
        'importcss_append'  => true,
        'block_formats'     => 'Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5',
        'style_formats'     => $formats,
        'paste_as_text'     => true,
    ]);
