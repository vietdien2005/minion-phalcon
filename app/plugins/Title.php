<?php

namespace MinionCMS\Plugin;

use \Phalcon\Mvc\User\Plugin;

class Title extends Plugin
{

    public function __construct($di)
    {
        $helper = $di->get('helper');
        if (!$helper->meta()->get('seo-manager')) {
            $helper->title($helper->translate('SITE NAME'));
        }
    }

} 