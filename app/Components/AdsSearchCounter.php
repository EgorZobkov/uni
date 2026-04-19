<?php

/**
 * UniSite CMS
 * @link https://unisite.org
 * Счётчики объявлений на поиск товаров.
 */

namespace App\Components;

class AdsSearchCounter
{
    public $alias = 'ads_search_counter';

    public function getCountByStatus($status = null)
    {
        global $app;

        if (isset($status)) {
            return numberFormat($app->model->ads_search_data->count("status=?", [$status]), 0, '.', ' ');
        }
        return 0;
    }
}
