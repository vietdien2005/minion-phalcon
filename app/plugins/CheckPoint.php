<?php

namespace MinionCMS\Plugin;

use Phalcon\Http\Request;

class CheckPoint
{

    public function __construct(Request $request)
    {
        if (strpos($request->getURI(), 'index.php') || strpos($request->getURI(), 'index.html')) {
            header('HTTP/1.0 301 Moved Permanently');
            $replaced_url = str_replace(
                ['index.php/', 'index.php', 'index.html'],
                ['', '', ''],
                str_replace('?', '', $request->getURI())
            );
            header('Location: http://' . $request->getHttpHost() . $replaced_url);
            exit(0);
        }
    }

}