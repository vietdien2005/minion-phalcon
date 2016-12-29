<?php
/*
 * Define custom routes. File gets included in the router service definition.
 */
$router = new \Application\Mvc\Router\DefaultRouter();

$router->add('/admin', [
    'module'     => 'admin', 
    'controller' => 'index', 
    'action'     => 'index'
])->setName('admin');

$router->add('/api', [
    'module'     => 'api',
    'controller' => 'index',
    'action'     => 'index'
])->setName('api');

$router->addML('/', [
    'module'     => 'index',
    'controller' => 'index',
    'action'     => 'index'
], 'index');

$router->addML('/{slug:[a-zA-Z0-9_-]+}.html', [
    'module'     => 'page',
    'controller' => 'index',
    'action'     => 'index'
], 'page');

$router->addML('/contacts.html', [
    'module'     => 'page',
    'controller' => 'index',
    'action'     => 'contacts'
], 'contacts');

$types_keys = array_keys(\Models\Publication\Type::types());
$types_regex = '(' . implode('|', $types_keys) . ')';

$router->add('/publication/admin/{type:' . $types_regex . '}', [
    'module'     => 'publication',
    'controller' => 'admin',
    'action'     => 'index'
])->setName('publications_admin');

$router->add('/publication/admin/{type:' . $types_regex . '}/([a-zA-Z0-9_]+)', array(
    'module'     => 'publication',
    'controller' => 'admin',
    'action'     => 2
))->setName('publications_admin_action');

$router->addML('/{type:' . $types_regex . '}', array(
    'module'     => 'publication',
    'controller' => 'index',
    'action'     => 'index'
), 'publications');

$router->addML('/{type:' . $types_regex . '}/{slug:[a-zA-Z0-9_-]+}.html', array(
    'module'     => 'publication',
    'controller' => 'index',
    'action'     => 'publication'
), 'publication');

return $router;
