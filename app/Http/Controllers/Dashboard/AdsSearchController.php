<?php

/**
 * UniSite CMS
 * @link https://unisite.org
 * Объявления на поиск товаров (дашборд).
 */

namespace App\Http\Controllers\Dashboard;

use App\Systems\Controller;

class AdsSearchController extends Controller
{
    public function __construct($app)
    {
        parent::__construct($app);
    }

    public function main()
    {
        if (!$this->user->verificationAccess('view')->status) {
            return $this->view->accessDenied();
        }

        $this->asset->registerJs(["view" => "dashboard", "name" => "<script src=\"{assets_path}/js/pages/ads-search.js\" type=\"module\"></script>"]);

        $this->view->setParamsComponent([
            'breadcrumbs' => [
                'chain' => [
                    translate('tr_dashboard_ads_search') => $this->router->getRoute('dashboard-ads-search'),
                ],
                'route_name' => $this->router->currentRoute->name,
                'page_name' => translate('tr_dashboard_ads_search'),
                'page_icon' => 'ti-search',
                'favorite_status' => true,
            ],
        ]);

        return $this->view->preload('board/ads-search', ['title' => translate('tr_dashboard_ads_search')]);
    }

    public function delete()
    {
        if (!$this->user->verificationAccess('control')->status) {
            return json_answer(["access" => false]);
        }
        $this->model->ads_search_data->delete("id=?", [$_POST['id']]);
        $this->session->setNotifyDashboard('success', translate("tr_6f9811271936b72e0d9c1f08d2dca0f4"));
        return json_answer(["status" => true]);
    }

    public function loadCard()
    {
        if (!$this->user->verificationAccess('control')->status) {
            return json_answer(["access" => false]);
        }
        $row = $this->model->ads_search_data->find("id=?", [$_POST['id']]);
        if (!$row) {
            return json_answer(["content" => ""]);
        }
        $data = $this->component->ads->getDataByValue((array)$row);
        return json_answer(['content' => $this->view->setParamsComponent(['data' => $data])->includeComponent('board/ads-search/load-card.tpl')]);
    }

    public function changeMultiStatus()
    {
        if (!$this->user->verificationAccess('control')->status) {
            return json_answer(["access" => false]);
        }

        if (empty($_POST['ids_selected']) || !is_array($_POST['ids_selected'])) {
            return json_answer(["status" => false]);
        }

        $status = isset($_POST['status']) ? (int)$_POST['status'] : 0;
        $ids = array_filter(array_map('intval', $_POST['ids_selected']));

        if (!$ids || !$status) {
            return json_answer(["status" => false]);
        }

        $placeholders = implode(',', array_fill(0, count($ids), '?'));
        $params = array_merge([$status], $ids);

        // обновляем статус выбранных объявлений на поиск
        $this->model->ads_search_data->updateQuery("status=? where id IN($placeholders)", $params);

        return json_answer(["status" => true]);
    }

    public function multiExtend()
    {
        if (!$this->user->verificationAccess('control')->status) {
            return json_answer(["access" => false]);
        }

        if (empty($_POST['ids_selected']) || !is_array($_POST['ids_selected'])) {
            return json_answer(["status" => false]);
        }

        $ids = array_filter(array_map('intval', $_POST['ids_selected']));

        if (!$ids) {
            return json_answer(["status" => false]);
        }

        $placeholders = implode(',', array_fill(0, count($ids), '?'));

        // продлеваем срок действия объявлений на их publication_period
        $this->model->ads_search_data->updateQuery(
            "time_expiration = DATE_ADD(COALESCE(time_expiration, time_create), INTERVAL publication_period DAY) where id IN($placeholders)",
            $ids
        );

        return json_answer(["status" => true]);
    }

    public function multiDelete()
    {
        if (!$this->user->verificationAccess('control')->status) {
            return json_answer(["access" => false]);
        }

        if (empty($_POST['ids_selected']) || !is_array($_POST['ids_selected'])) {
            return json_answer(["status" => false]);
        }

        $ids = array_filter(array_map('intval', $_POST['ids_selected']));

        if (!$ids) {
            return json_answer(["status" => false]);
        }

        $placeholders = implode(',', array_fill(0, count($ids), '?'));

        // удаляем выбранные объявления на поиск
        $this->model->ads_search_data->delete("id IN($placeholders)", $ids);

        return json_answer(["status" => true]);
    }
}
