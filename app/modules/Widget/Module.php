<?php

namespace Widget;

class Module
{

    public function registerAutoloaders()
    {

    }

    public function registerServices($di)
    {
        $dispatcher = $di->get('dispatcher');
        $dispatcher->setDefaultNamespace('Controllers\Widget');
        $di->set('dispatcher', $dispatcher);

        /**
         * Setting up the view component
         */
        $view = $di->get('view');
        $view->setViewsDir(APPLICATION_PATH . '/resources/volt/widget');

    }

}