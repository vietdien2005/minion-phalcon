<?php

namespace Application\Mvc\Model;

class Model extends \Phalcon\Mvc\Model
{
    const CACHE_LIFETIME = 300;

    protected $translations_array = []; 

    public $translations = [];
    public $fields = [];

    public static $lang = 'en'; 
    public static $custom_lang = ''; 
    private static $translateCache = true; 

    protected $translateModel; 

    public function initialize()
    {
        $this->hasMany("id", $this->translateModel, "foreign_id");
    }

    public function afterFetch()
    {
        if ($this->translateModel && defined('LANG')) {
            if(self::$custom_lang){
                self::setLang(self::$custom_lang);
            } else {
                self::setLang(LANG);
            }

            $this->initTranslationsArray();
            $this->initTranslations();
        }
    }

    public function afterUpdate()
    {
        $this->deleteTranslateCache();
    }

    public static function setLang($lang)
    {
        self::$lang = $lang;
    }

    public static function setCustomLang($lang)
    {
        self::$custom_lang = $lang;
    }

    public static function setTranslateCache($value)
    {
        self::$translateCache = (bool) $value;
    }

    public function getMLVariable($key)
    {
        if (array_key_exists($key, $this->translations)) {
            return $this->translations[$key];
        }

    }

    public function setMLVariable($key, $value, $lang = null)
    {
        if (!$this->getId()) {
            return false;
        }
        $model = new $this->translateModel();
        if (!$lang) {
            $lang = self::$lang;
        }
        $conditions = "foreign_id = :foreign_id: AND lang = :lang: AND key = :key:";
        $parameters = [
            'foreign_id' => $this->getId(),
            'lang'       => $lang,
            'key'        => $key
        ];
        $entity = $model->findFirst([
            $conditions,
            'bind' => $parameters]);
        if (!$entity) {
            $entity = new $this->translateModel();
            $entity->setForeignId($this->getId());
            $entity->setLang($lang);
            $entity->setKey($key);
        }
        $entity->setValue($value);
        $entity->save();
    }

    public function translateCacheKey()
    {
        if (!$this->getId()) {
            return false;
        }
        $query = 'foreign_id = ' . $this->getId() . ' AND lang = "' . self::$lang . '"';
        $key = HOST_HASH . md5($this->getSource() . '_translate ' . $query);
        return $key;
    }

    public function deleteTranslateCache()
    {
        if (!$this->getId()) {
            return false;
        }
        $cache = $this->getDi()->get('cache');
        $cache->delete($this->translateCacheKey());
    }

    private function initTranslationsArray()
    {
        if (!$this->getId()) {
            return false;
        }
        $model = new $this->translateModel();
        $query = 'foreign_id = ' . $this->getId() . ' AND lang = "' . self::$lang . '"';
        $params = ['conditions' => $query];

        if (self::$translateCache) {
            $cache = $this->getDi()->get('cache');
            $data = $cache->get($this->translateCacheKey());
            if (!$data) {
                $data = $model->find($params);
                if ($data) {
                    $cache->save($this->translateCacheKey(), $data, self::CACHE_LIFETIME);
                }
            }
        } else {
            $data = $model->find($params);
        }

        $this->translations_array = $data;
    }

    public function initTranslations()
    {
        if (!empty($this->translations_array)) {
            foreach ($this->translations_array as $translation) {
                $this->translations[$translation->getKey()] = $translation->getValue();
            }
        }
    }

}
