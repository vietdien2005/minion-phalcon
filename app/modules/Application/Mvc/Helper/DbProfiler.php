<?php

namespace Application\Mvc\Helper;

class DbProfiler extends \Phalcon\Mvc\User\Component
{

    public function DbOutput()
    {
        $profiler = $this->getDi()->get('profiler');

        $this->view->start();
        $this->view->partial('profiler', array(
            'profiler'    => $profiler,
        ));
        $html = ob_get_contents();
        $this->view->finish();

        return $html;

    }

}
