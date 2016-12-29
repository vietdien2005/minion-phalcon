<?php

return [
    'environment'    => 'development',

    'loader'         => [
        'namespaces' => [
            // Here you can setup your new vendor namespace, example:
            // 'Zend' => APPLICATION_PATH . '/vendor/zendframework/zendframework/library/Zend',
        ],
    ],

    // Language for admin dashboard.
    // Values: en.
    // All translations contains in /app/modules/Cms/admin_translations in files with names en.php.
    // To add another language you can create in this directory new file with name de.php and set 'admin_language' => 'de' it will works.
    'admin_language' => 'en',

    // Modules "Application" and "Cms" loads automatically
    'modules' => [
        'Image',
        'Index',
        'Admin',
        'Widget',
        'Page',
        'Publication',
        'Menu',
        'Api',
    ]

];