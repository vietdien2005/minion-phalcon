<?php

namespace Requests\Cms;

use Application\Form\Form;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;

class ConfigurationForm extends Form
{

    public function initialize()
    {
        $this->add((new Check('DEBUG_MODE'))->setLabel('Debug mode, display application errors'));
        $this->add((new Check('PROFILER'))->setLabel('DB Profiler'));
        $this->add((new Check('WIDGETS_CACHE'))->setLabel('Widgets caching'));
        $this->add((new Text('ADMIN_EMAIL'))->setLabel('Admin Email'));
        $this->add((new Check('TECHNICAL_WORKS'))->setLabel('Site is under maintenance'));

    }

} 