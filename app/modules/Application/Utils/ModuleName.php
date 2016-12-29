<?php
    
namespace Application\Utils;


class ModuleName
{

    public static function camelize($module)
    {
        $tmpModuleNameArr = explode('-', $module);
        $moduleName = '';
        foreach ($tmpModuleNameArr as $part) {
            $moduleName .= \Phalcon\Text::camelize($part);
        }
        return $moduleName;
    }

} 