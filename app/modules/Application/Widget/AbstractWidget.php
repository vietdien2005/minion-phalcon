<?php

namespace Application\Widget;

class AbstractWidget extends \Phalcon\Mvc\User\Component
{

    private $module;

    public function widgetPartial($template, array $data = array())
    {
        return $this->helper->modulePartial($template, $data, $this->module);

    }

    public function setModule($module)
    {
        $this->module = $module;
    }

}
