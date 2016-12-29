<?php

namespace Cms;

class Config
{

    public static function get()
    {
        $global = include_once APPLICATION_PATH . '/config/global.php';

        $application = include_once APPLICATION_PATH . '/config/environment/' . $global['environment'] . '.php';

        $config_default = [
            'environment' => 'development',
            'loader'      => [
                'namespaces' => [
                    'MinionCMS\Plugin' => APPLICATION_PATH . '/app/plugins/',
                    'Controllers'      => APPLICATION_PATH . '/app/controllers/',
                    'Models'           => APPLICATION_PATH . '/app/models/',
                    'Requests'         => APPLICATION_PATH . '/app/requests/',
                    'Application'      => APPLICATION_PATH . '/app/modules/Application',
                    'Cms'              => APPLICATION_PATH . '/app/modules/Cms',
                ],
            ],
            'modules' => [
                'cms' => [
                    'className' => 'Cms\Module',
                    'path'      => APPLICATION_PATH . '/app/modules/Cms/Module.php'
                ],
            ],
            'base_path' => (isset($application['base_path'])) ? $application['base_path'] : null,
            'database'  => (isset($application['database'])) ? $application['database'] : null,
            'cache'     => (isset($application['cache'])) ? $application['cache'] : null,
            'redis'     => (isset($application['redis'])) ? $application['redis'] : null,
        ];

        // Modules configuration list
        require_once APPLICATION_PATH . '/app/modules/Application/Loader/Modules.php';
        $modules = new \Application\Loader\Modules();
        $modules_config = $modules->modulesConfig($global['modules']);

        $config = array_merge_recursive($config_default, $global, $modules_config);

        return new \Phalcon\Config($config);
    }

}
