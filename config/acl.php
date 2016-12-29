<?php

return [

    // frontend
    'guest'      => [
        'admin/index'       => '*',
        'index/index'       => '*',
        'index/error'       => '*',
        'page/index'        => '*',
        'publication/index' => '*',
        'api/index'         => '*',
        'api/page'          => '*',
    ],
    'member'     => [
        'index/index' => '*',
    ],
    // backend
    'journalist' => [
        'publication/admin'  => [
            'index',
            'add',
            'edit',
        ],
        'page/admin'         => [
            'index',
            'add',
            'edit',
        ],
    ],
    'editor'     => [
        'publication/admin'  => '*',
        'publication/type'   => '*',
        'cms/translate'      => '*',
        'widget/admin'       => '*',
        'page/admin'         => '*',
    ],
    'admin'      => [
        'admin/admin-user'   => '*',
        'cms/configuration'  => '*',
        'cms/translate'      => '*',
        'cms/language'       => '*',
        'widget/admin'       => '*',
        'page/admin'         => '*',
        'publication/admin'  => '*',
        'publication/type'   => '*',
    ],
];