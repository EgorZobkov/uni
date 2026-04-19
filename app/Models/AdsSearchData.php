<?php

/**
 * UniSite CMS
 * @link    https://unisite.org
 * Объявления на поиск товаров.
 */

namespace App\Models;

use App\Systems\Model;

class AdsSearchData extends Model
{
    public $alias = 'ads_search_data';
    public $table = 'uni_ads_search_data';

    public function geo($params = [])
    {
        $this->geo = $params;
        return $this;
    }

    public function getAll($conditions = null, $params = [])
    {
        global $app;

        $query = [];
        $sort = "";
        $results = [];

        if (isset($this->sort)) {
            $sort = "order by " . $this->sort;
        }

        if (isset($conditions)) {
            $query[] = $conditions;
        }

        if ($this->search) {
            $query[] = '(search_tags LIKE ? OR article_number LIKE ? OR title LIKE ? OR text LIKE ?)';
            $params[] = '%' . $this->search . '%';
            $params[] = '%' . $this->search . '%';
            $params[] = '%' . $this->search . '%';
            $params[] = '%' . $this->search . '%';
        }

        if (isset($this->geo)) {
            if ($this->geo->city_id) {
                $query[] = 'city_id=?';
                $params[] = $this->geo->city_id;
            } elseif ($this->geo->region_id) {
                $query[] = 'region_id=?';
                $params[] = $this->geo->region_id;
            } elseif ($this->geo->country_id) {
                $query[] = 'country_id=?';
                $params[] = $this->geo->country_id;
            }
        }

        if (isset($this->filter)) {
            if (isset($this->filter["status"])) {
                $query[] = 'status=?';
                $params[] = $app->clean->int($this->filter["status"]);
            }
            if (isset($this->filter["category_id"])) {
                $query[] = 'category_id=?';
                $params[] = $app->clean->int($this->filter["category_id"]);
            }
            if (isset($this->filter["today"])) {
                $query[] = 'date(time_create)=?';
                $params[] = $app->datetime->format("Y-m-d")->getDate();
            }
            if (!empty($this->filter["date_start"]) || !empty($this->filter["date_end"])) {
                if (!empty($this->filter["date_start"]) && !empty($this->filter["date_end"])) {
                    $query[] = '(DATE(time_create) BETWEEN ? and ?)';
                    $params[] = $app->clean->str($this->filter["date_start"]);
                    $params[] = $app->clean->str($this->filter["date_end"]);
                } elseif (!empty($this->filter["date_start"])) {
                    $query[] = 'DATE(time_create)=?';
                    $params[] = $app->clean->str($this->filter["date_start"]);
                }
            }
        }

        if ($this->paginationStatus) {
            if ($query) {
                $totalCount = $this->count(implode(" and ", $query), $params);
                $app->pagination->page($this->page)->output($this->output)->total($totalCount)->init();
                $results = $app->db->getAll("select * from `" . $this->table . "` where " . implode(" and ", $query) . " $sort " . $app->pagination->offset(), $params);
            } else {
                $totalCount = $this->count();
                $app->pagination->page($this->page)->output($this->output)->total($totalCount)->init();
                $results = $app->db->getAll("select * from `" . $this->table . "` $sort " . $app->pagination->offset());
            }
        } else {
            if ($query) {
                $results = $app->db->getAll("select * from `" . $this->table . "` where " . implode(" and ", $query) . " " . $sort, $params);
            } else {
                $results = $app->db->getAll("select * from `" . $this->table . "` " . $sort);
            }
        }

        $this->filter(null);
        $this->geo(null);
        $this->search(null);
        $this->sort(null);
        $this->pagination(null);

        return $results;
    }
}
