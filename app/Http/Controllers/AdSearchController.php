<?php

/**
 * UniSite CMS
 * @link https://unisite.org
 * Объявления на поиск товаров (фронт).
 */

namespace App\Http\Controllers;

use App\Systems\Controller;

class AdSearchController extends Controller
{
    public function __construct($app)
    {
        parent::__construct($app);
    }

    /**
     * Снять объявление «ищу товар» с публикации (статус 3), только владелец.
     */
    public function changeCardStatusPublication()
    {
        if (!$this->user->isAuth()) {
            return json_answer(['auth' => false]);
        }
        $id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
        if (!$id) {
            return json_answer(['status' => false]);
        }
        $this->model->ads_search_data->update(['status' => 3], ['id=? and user_id=?', [$id, $this->user->data->id]]);

        return json_answer(['status' => true]);
    }

    public function showContacts()
    {
        $contacts_items = '';
        $ad_contact = $this->session->get('ad-search-contact');

        if (empty($ad_contact[$_POST['id']])) {
            return;
        }

        $data = $this->component->ads->getAdSearch((int)$_POST['id']);

        if (!$data || $data->status != 1 || $data->block_forever_status) {
            return;
        }

        $contact_name = ($data->contacts->name ?? null) ?: $data->user->name;

        $visibility = $this->model->users_contacts_visibility->find("user_id=?", [$data->user_id]);
        $showPhone = $visibility && $visibility->show_phone;
        $showEmail = $visibility && $visibility->show_email;
        $showTelegram = $visibility && $visibility->show_telegram;
        $showVk = $visibility && $visibility->show_vk;

        $phone = $visibility ? ($visibility->phone ?: $data->user->phone) : ($data->user->phone ?? '');
        $email = $visibility ? ($visibility->email ?: $data->user->email) : ($data->user->email ?? '');

        if ($showPhone && $phone) {
            if ($this->settings->phone_add_plus_status) {
                $phone = '+' . trim($phone, '+');
            }
            $contacts_items .= '
                    <a class="card-contact-user-item-box" href="tel:' . $phone . '" target="_blank" >
                        <img src="' . $this->storage->name('9aa2c959051f186bf1f74435227f2a1a.webp')->path('images')->get() . '" />
                        ' . $phone . '
                    </a>
                ';
        }

        if ($showEmail && $email) {
            $contacts_items .= '
                    <a class="card-contact-user-item-box" href="mailto:' . $email . '" target="_blank" >
                        <img src="' . $this->storage->name('ad4223f1837394992a75515fb489a3e4.webp')->path('images')->get() . '" />
                        ' . $email . '
                    </a>
                ';
        }

        $uc = $data->user->contacts ?? null;
        $telegram = $visibility ? $visibility->telegram : (($uc && isset($uc->telegram)) ? $uc->telegram : '');
        $vk = $visibility ? $visibility->vk : null;

        if ($showTelegram && $telegram) {
            $contacts_items .= '
                    <a class="card-contact-user-item-box" href="https://t.me/' . htmlspecialchars($telegram) . '" target="_blank" >
                        <img src="' . $this->storage->name('social/tg.png')->path('images')->get() . '" />
                        Telegram
                    </a>
                ';
        }

        if ($showVk && $vk) {
            $vkLink = (strpos($vk, 'http') === 0) ? $vk : 'https://vk.com/' . ltrim($vk, '/');
            $contacts_items .= '
                    <a class="card-contact-user-item-box" href="' . htmlspecialchars($vkLink) . '" target="_blank" >
                        <img src="' . $this->storage->name('social/vk.png')->path('images')->get() . '" />
                        ВКонтакте
                    </a>
                ';
        }

        $content = '
            <div class="card-contact-user" >

                <div class="card-contact-user-item" >
                <p>' . translate('tr_d38d6d925c80a2267031f3f03d0a9070') . '</p>
                <h4>' . htmlspecialchars($contact_name) . '</h4>
                </div>

                <div class="card-contact-user-item" >
                <p>' . translate('tr_75768c49c24662cc4465237b0731e1ce') . '</p>

                ' . $contacts_items . '

                </div>

            </div>';

        if ($this->settings->board_card_who_phone_view == 'all') {
            if ($this->user->isAuth()) {
                $this->event->showAdContacts(['ad_id' => (int)$_POST['id'], 'from_user_id' => $this->user->data->id]);
            }
            return json_answer(['content' => $content]);
        }

        if ($this->settings->board_card_who_phone_view == 'auth') {
            if ($this->user->isAuth()) {
                if ($this->component->profile->checkVerificationPermissions($this->user->data->id, 'view_contacts')) {
                    $this->event->showAdContacts(['ad_id' => (int)$_POST['id'], 'from_user_id' => $this->user->data->id]);
                    return json_answer(['content' => $content]);
                }
                return json_answer(['verification' => false]);
            }
            return json_answer(['auth' => false]);
        }
    }

    public function create()
    {
        $this->view->visible_header = false;
        $this->view->visible_footer = false;

        $this->asset->registerJs(["view" => "web", "name" => "<script src=\"{assets_path}/js/ad.js\" type=\"module\"></script>"]);
        $this->asset->registerJs(["view" => "web", "name" => "<script src=\"{assets_path}/vendors/minicolors/jquery.minicolors.min.js\"></script>"]);
        $this->asset->registerCss(["view" => "web", "name" => "<link rel=\"stylesheet\" href=\"{assets_path}/vendors/minicolors/jquery.minicolors.css\" />"]);

        $seo = (object)[
            'meta_title' => translate('tr_ad_search_create_page_title'),
            'h1' => translate('tr_ad_search_create_page_title'),
        ];

        return $this->view->render('ad-search-create', ['seo' => $seo]);
    }

    /**
     * Редактирование объявления «ищу товар» (как /ad/edit для продажи: тот же ad.js, без шапки/подвала).
     */
    public function edit($id)
    {
        $this->view->visible_header = false;
        $this->view->visible_footer = false;

        $this->asset->registerJs(["view" => "web", "name" => "<script src=\"{assets_path}/js/ad.js\" type=\"module\"></script>"]);
        $this->asset->registerJs(["view" => "web", "name" => "<script src=\"{assets_path}/vendors/minicolors/jquery.minicolors.min.js\"></script>"]);
        $this->asset->registerCss(["view" => "web", "name" => "<link rel=\"stylesheet\" href=\"{assets_path}/vendors/minicolors/jquery.minicolors.css\" />"]);

        $data = $this->component->ads->getAdSearch((int)$id);

        if (!$data || !is_object($data)) {
            abort(404);
        }

        if ($this->user->isAdminAuthAndCheckAccess('control', 'dashboard-ads')->status) {
            $data->isAdmin = true;
        } else {
            $data->isAdmin = false;
            if ((int)$data->user_id !== (int)$this->user->data->id) {
                abort(404);
            }
            if ($data->status == 4 && $data->block_forever_status) {
                abort(404);
            }
        }

        return $this->view->render('ad-search-edit', [
            'data' => $data,
            'seo' => (object)['meta_title' => $data->title],
        ]);
    }

    public function update()
    {
        if (!$this->user->isAuth()) {
            return json_answer(['auth' => false]);
        }

        $id = isset($_POST['ad_search_id']) ? (int)$_POST['ad_search_id'] : 0;
        if (!$id) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => []]);
        }

        $row = $this->model->ads_search_data->find('id=?', [$id]);
        if (!$row) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => []]);
        }

        $admin = $this->user->isAdminAuthAndCheckAccess('control', 'dashboard-ads')->status;
        if (!$admin && (int)$row->user_id !== (int)$this->user->data->id) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => []]);
        }
        if (!$admin && (int)$row->status === 4 && !empty($row->block_forever_status)) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => []]);
        }

        $answer = [];
        $title = trim($this->clean->str($_POST['title'] ?? ''));
        $text = trim($this->clean->str($_POST['text'] ?? ''));

        if (mb_strlen($title) < 2) {
            $answer['title'] = translate('tr_33ea34d8ad8f8fb23396552ee810fa9e') . ' — ' . translate('tr_40f621eeceedda3781fb5610a0aaec60');
        }
        if (mb_strlen($text) < 10) {
            $answer['text'] = translate('tr_38ca0af80cd7bd241500e81ba2e6efff') . ' — ' . translate('tr_40f621eeceedda3781fb5610a0aaec60');
        }

        if (!empty($answer)) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => $answer]);
        }

        $price = isset($_POST['price']) ? $this->clean->float($_POST['price']) : null;
        $geo_city_id = isset($_POST['geo_city_id']) ? $this->clean->int($_POST['geo_city_id']) : 0;
        $delivery_shipping_status = !empty($_POST['delivery_shipping_status']) ? 1 : 0;

        $country_id = 0;
        $region_id = 0;

        if ($geo_city_id) {
            $geoCity = $this->component->geo->getCityData($geo_city_id);
            if ($geoCity) {
                $country_id = (int)$geoCity->country_id;
                $region_id = (int)$geoCity->region_id;
            }
        }

        $media = [];
        if (!empty($_POST['media']) && is_array($_POST['media'])) {
            foreach ($_POST['media'] as $item) {
                if (!empty($item['image'])) {
                    $media[] = ['image' => $this->clean->str($item['image'])];
                }
            }
        }

        $mediaJson = $this->component->ads->uploadMedia($media, $row);

        $alias = slug($title ?: ('ad-search-' . $id));
        if ($alias === '') {
            $alias = 'a' . $id;
        }

        $update = [
            'title' => $title,
            'text' => $text,
            'price' => $price ?: 0,
            'delivery_shipping_status' => $delivery_shipping_status,
            'country_id' => $country_id,
            'region_id' => $region_id,
            'city_id' => $geo_city_id,
            'alias' => $alias,
            'search_tags' => trim($title . ' ' . $text),
            'time_update' => $this->datetime->getDate(),
            'media' => $mediaJson,
        ];

        $this->model->ads_search_data->update($update, $id);

        $card = $this->component->ads->getAdSearch($id);
        $route = is_object($card) ? $this->component->ads->buildAliasesAdSearchCard($card) : outLink();

        return json_answer(['status' => true, 'route' => $route]);
    }

    public function publication()
    {
        $answer = [];

        if (!$this->user->isAuth()) {
            return json_answer(['auth' => false]);
        }

        $title = trim($this->clean->str($_POST['title'] ?? ''));
        $text = trim($this->clean->str($_POST['text'] ?? ''));

        if (mb_strlen($title) < 2) {
            $answer['title'] = translate('tr_33ea34d8ad8f8fb23396552ee810fa9e') . ' — ' . translate('tr_40f621eeceedda3781fb5610a0aaec60');
        }
        if (mb_strlen($text) < 10) {
            $answer['text'] = translate('tr_38ca0af80cd7bd241500e81ba2e6efff') . ' — ' . translate('tr_40f621eeceedda3781fb5610a0aaec60');
        }

        if (!empty($answer)) {
            return json_answer(['status' => false, 'type_answer' => 'error', 'type_show' => 'form', 'answer' => $answer]);
        }

        $price = isset($_POST['price']) ? $this->clean->float($_POST['price']) : null;
        $geo_city_id = isset($_POST['geo_city_id']) ? $this->clean->int($_POST['geo_city_id']) : 0;
        $delivery_shipping_status = !empty($_POST['delivery_shipping_status']) ? 1 : 0;

        $country_id = 0;
        $region_id = 0;

        if ($geo_city_id) {
            $geoCity = $this->component->geo->getCityData($geo_city_id);
            if ($geoCity) {
                $country_id = (int)$geoCity->country_id;
                $region_id = (int)$geoCity->region_id;
            }
        }

        $media = [];
        if (!empty($_POST['media']) && is_array($_POST['media'])) {
            foreach ($_POST['media'] as $item) {
                if (!empty($item['image'])) {
                    $media[] = ['image' => $this->clean->str($item['image'])];
                }
            }
        }

        $time_create = $this->datetime->getDate();
        $publication_period = 30;
        $time_expiration = $this->datetime->addDay($publication_period)->getDate($time_create);

        $insert = [
            'user_id' => $this->user->data->id,
            'category_id' => 0,
            'country_id' => $country_id,
            'region_id' => $region_id,
            'city_id' => $geo_city_id,
            'title' => $title,
            'text' => $text,
            'price' => $price ?: 0,
            'delivery_shipping_status' => $delivery_shipping_status,
            'status' => (int)$this->settings->board_publication_moderation_status,
            'publication_period' => $publication_period,
            'time_create' => $time_create,
            'time_expiration' => $time_expiration,
            'time_sorting' => $time_create,
        ];

        $id = $this->model->ads_search_data->insert($insert);

        if ($id && $media) {
            // Один аргумент, как при публикации обычного объявления (Ads::publication).
            $mediaJson = $this->component->ads->uploadMedia($media);
            if ($mediaJson) {
                // Model::update принимает только ($params, $id | [$where, $bind]); третий аргумент не существует.
                $this->model->ads_search_data->update(['media' => $mediaJson], $id);
            }
        }

        if ($id) {
            // Как у объявлений о продаже: в БД только slug, id добавляется в URL (buildAliasesAdSearchCard).
            $alias = slug($title ?: ('ad-search-' . $id));
            if ($alias === '') {
                $alias = 'a' . $id;
            }
            $search_tags = trim($title . ' ' . $text);
            $this->model->ads_search_data->update(
                ['alias' => $alias, 'search_tags' => $search_tags],
                $id
            );
        }

        $route = $this->router->getRoute('profile-ads') . '?tab=search';
        return json_answer(['status' => true, 'route' => $route]);
    }

    /**
     * Каталог объявлений «ищу товар»: сетка как на главной, фильтры слева.
     */
    public function catalog()
    {
        $this->asset->registerJs(['view' => 'web', 'name' => '<script src="{assets_path}/js/ad-search-catalog.js" type="module"></script>']);

        $seo = (object)[
            'meta_title' => translate('tr_home_people_search'),
            'h1' => translate('tr_home_people_search'),
        ];

        return $this->view->render('ad-search-catalog', ['seo' => $seo]);
    }

    /**
     * Подгрузка карточек (как catalog/load-items).
     */
    public function loadCatalogItems()
    {
        $content = '';
        $page = isset($_POST['page']) ? (int)$_POST['page'] : 1;
        if ($page < 1) {
            $page = 1;
        }

        $this->pagination->request($_POST);

        $sortParam = $_POST['sort'] ?? 'time';
        if ($sortParam === 'news') {
            $sort = 'id desc';
        } elseif ($sortParam === 'price_asc') {
            $sort = 'price asc';
        } elseif ($sortParam === 'price_desc') {
            $sort = 'price desc';
        } else {
            $sort = 'time_sorting desc';
        }

        $geo = $this->session->get('geo');
        $build = $this->component->ads->buildAdsSearchListQuery($_POST, $geo);

        $data = $this->model->ads_search_data->pagination(true)->page($page)->output($this->settings->out_default_count_items)->sort($sort)->getAll($build['query'], $build['params']);

        if ($data && $page <= $this->pagination->pages()) {
            $cells = '';
            foreach ($data as $value) {
                $value = $this->component->ads->getDataByValue($value);
                $cells .= $this->view->setParamsComponent(['value' => $value])->includeComponent('items/home-search-grid.tpl');
            }

            if ($page + 1 <= $this->pagination->pages()) {
                $result = '
                   <div class="row g-2 g-lg-3" style="display: none;" >
                      ' . $cells . '
                   </div>
                   <div class="text-center" >
                      <button type="button" class="btn-custom button-color-scheme1 actionShowMoreAdSearchItems" >' . translate('tr_11d9e7ea0320006d822a967777abd16a') . '</button>
                   </div>
                ';
            } else {
                $result = '
                   <div class="row g-2 g-lg-3" style="display: none;" >
                      ' . $cells . '
                   </div>
                   <div class="text-center mt15" >
                      <p>' . translate('tr_6b377edee6db2cf591176951b7cd497e') . '</p>
                   </div>
                ';
            }
        } else {
            if ($page === 1) {
                $result = '
                   <div class="catalog-not-found" >
                      <h4>' . translate('tr_8767f9ec282489d3e8e29021d0967187') . '</h4>
                      <p>' . translate('tr_a7b03ac2b15fd0bff35a274c8b603c63') . '</p>
                      <p>' . translate('tr_e9d264db2a7d22c56ac22e8750838d49') . '</p>
                   </div>
                ';
            } else {
                $result = '<div class="text-center mt15" ><p>' . translate('tr_6b377edee6db2cf591176951b7cd497e') . '</p></div>';
            }
        }

        return json_answer(['content' => $result]);
    }
}
