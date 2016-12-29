<?php

namespace Application\Utils;

class Hash
{

    public static function generateHash($length = 12)
    {
        $list = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $len = mb_strlen($list, 'utf-8');

        $result = '';
        for ($i = 1; $i <= $length; $i++) {
            $element = rand(0, $len - 1);
            $char = $list[$element];
            $result .= $char;
        }

        return $result;

    }

}
