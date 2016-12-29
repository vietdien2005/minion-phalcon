<?php

namespace Models\Publication\Helper;

use Application\Cache\Keys;
use Models\Publication\Publication;

class PublicationHelper extends Publication
{

    public function publicationBySlug($slug, $lang = null, $lifeTime = 60)
    {
        $lang = ($lang) ? $lang : LANG;

        $publicationResult = $this->getDi()->get('cacheManager')->load([
            Keys::PUBLICATION,
            $slug,
            $lang

        ], function() use ($slug, $lang, $lifeTime) {
            $columns = [
                'p.*',
                't_slug' => 't.slug'
            ];
            $fields = $this->translateFieldsSubQuery($lang);
            $columns = array_merge($columns, $fields);

            $qb = $this->modelsManager->createBuilder()
                ->columns($columns)
                ->addFrom('Models\Publication\Publication', 'p')
                ->innerJoin('Models\Publication\Type', 'p.type_id = t.id', 't')
                ->where('p.slug = :slug:', ['slug' => $slug]);

            $result = $qb->getQuery()->execute()->getFirst();
            return $result;

        }, $lifeTime);

        return $publicationResult;
    }

    public function translateFieldsSubQuery($lang = null)
    {
        $lang = ($lang) ? $lang : LANG;
        
        $fields = [];
        foreach($this->translateFields as $field) {
            $fields[] = "(SELECT tr.value FROM [$this->translateModel] AS tr WHERE tr.foreign_id = p.id AND tr.lang = '$lang' AND tr.key = '$field') AS $field";
        }
        return $fields;
    }

}