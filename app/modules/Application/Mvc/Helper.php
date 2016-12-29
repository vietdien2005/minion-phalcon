<?php

namespace Application\Mvc;

use Application\Mvc\Router\DefaultRouter;
use Models\Cms\Language;

class Helper extends \Phalcon\Mvc\User\Component
{
    const StaticWidgetDefaultOptions = [
        'lifetime' => 120
    ];

    private $translate = null;
    private $admin_translate = null;

    public $menu;

    public function __construct()
    {
        $this->menu = \Menu\Helper\Menu::getInstance();
    }

    public function translate($string, $placeholders = null)
    {
        if (!$this->translate) {
            $this->translate = $this->getDi()->get('translate');
        }
        return $this->translate->query($string, $placeholders);

    }

    public function at($string, $placeholders = null)
    {
        if (!$this->admin_translate) {
            $this->admin_translate = $this->getDi()->get('admin_translate');
        }
        return $this->admin_translate->query($string, $placeholders);

    }

    public function widget($namespace = 'Index', array $params = [])
    {
        return new \Application\Widget\Proxy($namespace, $params);
    }

    public function staticWidget($id, $params = [])
    {
        $mergeConfig = array_merge(self::StaticWidgetDefaultOptions, $params);
        $widget = \Models\Widget\Widget::findFirst(["id='{$id}'", "cache" => ["lifetime" => $mergeConfig["lifetime"], "key" => HOST_HASH . md5("Widget::findFirst({$id})")]]);
        if ($widget) {
            return $widget->getHtml();
        }
    }

    public function langUrl($params)
    {
        $routeName = $params['for'];
        $routeName = DefaultRouter::ML_PREFIX . $routeName . '_' . LANG;
        $params['for'] = $routeName;
        return $this->url->get($params);
    }

    public function languages()
    {
        return Language::findCachedLanguages();

    }

    public function langSwitcher($lang, $string)
    {
        $helper = new \Application\Mvc\Helper\LangSwitcher();
        return $helper->render($lang, $string);
    }

    public function cacheExpire($seconds)
    {
        $response = $this->getDi()->get('response');
        $expireDate = new \DateTime();
        $expireDate->modify("+$seconds seconds");
        $response->setExpires($expireDate);
        $response->setHeader('Cache-Control', "max-age=$seconds");
    }

    public function isAdminSession()
    {
        $session = $this->getDi()->get('session');
        $auth = $session->get('auth');
        if ($auth) {
            if ($auth->admin_session == true) {
                return true;
            }
        }
    }

    public function error($code = 404)
    {
        $helper = new \Application\Mvc\Helper\ErrorReporting();
        return $helper->{'error' . $code}();

    }

    public function title($title = null, $h1 = false)
    {
        return \Application\Mvc\Helper\Title::getInstance($title, $h1);
    }

    public function meta()
    {
        return \Application\Mvc\Helper\Meta::getInstance();
    }

    public function activeMenu()
    {
        return \Application\Mvc\Helper\ActiveMenu::getInstance();
    }

    public function announce($incomeString, $num)
    {
        $object = new \Application\Mvc\Helper\Announce();
        return $object->getString($incomeString, $num);
    }

    public function dbProfiler()
    {
        $object = new \Application\Mvc\Helper\DbProfiler();
        return $object->DbOutput();
    }

    public function constant($name)
    {
        return get_defined_constants()[$name];
    }

    public function image($args, $attributes = [])
    {
        $imageFilter = new \Image\Storage($args, $attributes);
        return $imageFilter;
    }

    public function querySymbol()
    {
        $object = new \Application\Mvc\Helper\RequestQuery();
        return $object->getSymbol();
    }

    public function modulePartial($template, $data, $module = null)
    {
        $view = clone $this->getDi()->get('view');
        $partialsDir = '';
        if ($module) {
            $moduleName = \Application\Utils\ModuleName::camelize($module);
            $partialsDir = APPLICATION_PATH . '/resources/volt/' . strtolower($moduleName) . '/';
        }
        $view->setPartialsDir($partialsDir);

        return $view->partial($template, $data);
    }

    /**
     * Get the path to a versioned Elixir file.
     *
     * @param  string  $file
     * @param  string  $buildDirectory
     * @return string
     *
     * @throws \InvalidArgumentException
     */
    public function elixir($file, $buildDirectory = 'build')
    {
        static $manifest = [];
        static $manifestPath;

        if (empty($manifest) || $manifestPath !== $buildDirectory) {
            $path = APPLICATION_PATH . '/public/' . $buildDirectory . '/rev-manifest.json';

            if (file_exists($path)) {
                $manifest = json_decode(file_get_contents($path), true);
                $manifestPath = $buildDirectory;
            }
        }

        if (isset($manifest[$file])) {
            return '/'.trim($buildDirectory.'/'.$manifest[$file], '/');
        }

        $unversioned = APPLICATION_PATH . '/public/' . $file;

        if (file_exists($unversioned)) {
            return '/'.trim($file, '/');
        }

        throw new \InvalidArgumentException("File {$file} not defined in asset manifest.");
    }

}
