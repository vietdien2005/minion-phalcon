<?php

return [
    'base_path' => '/',

    'database'  => [
        'adapter'  => 'Mysql',
        'host'     => 'localhost',
        'username' => 'root',
        'password' => '',
        'dbname'   => 'minion',
        'charset'  => 'utf8',
    ],

    'redis'  => [
        'host' => 'localhost',
        'port' => 6379,
    ],

    'cache'     => 'redis', // file, redis
];