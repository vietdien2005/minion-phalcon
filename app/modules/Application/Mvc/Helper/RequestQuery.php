<?php

namespace Application\Mvc\Helper;

class RequestQuery extends \Phalcon\Mvc\User\Component
{

    public function getSymbol()
    {
        $queries = $this->request->getQuery();
        if (count($queries) == 1) {
            return '?';
        } else {
            return '&';
        }
    }

} 