<?php

chdir(dirname(__DIR__));

define('ROOT', __DIR__);
define('HOST_HASH', substr(md5($_SERVER['HTTP_HOST']), 0, 12));

define('APPLICATION_PATH', __DIR__ . '/..');

require_once APPLICATION_PATH . '/app/Bootstrap.php';
$bootstrap = new MinionCMS\Bootstrap();
$bootstrap->run();
