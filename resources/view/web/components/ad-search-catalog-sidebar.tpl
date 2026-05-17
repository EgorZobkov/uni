<?php
/**
 * Фильтры каталога «ищу товар» (как блок параметров в каталоге продажи).
 * @var array $filterParams из $_GET
 */
$params = isset($filterParams) && is_array($filterParams) ? $filterParams : [];
$filter = isset($params['filter']) && is_array($params['filter']) ? $params['filter'] : [];
$sw = isset($filter['switch']) && is_array($filter['switch']) ? $filter['switch'] : [];
$sort_val = isset($params['sort']) && $params['sort'] !== '' ? $params['sort'] : 'time';
$geoObj = null;
?>
<input type="hidden" name="sort" value="<?php echo htmlspecialchars((string)$sort_val, ENT_QUOTES, 'UTF-8'); ?>">
<div class="params-form-filters-container ds-stack-16">
<?php if (!empty($app->settings->active_countries)) { ?>
    <?php
    $geo = $app->component->geo->getChange();
    $myCityUrl = '';
    if (isset($app->user) && method_exists($app->user, 'isAuth') && $app->user->isAuth() && isset($app->user->data) && !empty($app->user->data->city_id)) {
        $myCity = $app->component->geo->getCityData($app->user->data->city_id);
        if ($myCity) {
            $myCityUrl = $app->component->geo->replaceAliases((array)$myCity);
        }
    }
    $geoObj = (is_object($geo) && !empty($geo->data)) ? $geo : null;
    ?>
    <div class="params-form-item params-form-item-geo-sale-city">
        <label class="params-form-item-label"><?php echo translate('tr_06d897a2b68c63493b65390fe35e7a2a'); ?></label>
        <div class="uni-select params-form-item-geo-sale-city-select" data-status="0" data-bs-target="#geoModal" data-bs-toggle="modal">
            <span class="uni-select-name" data-default-name="<?php echo translate('tr_9a73b1e5b44bee481ab175b7e327451e'); ?>">
                <?php echo $geoObj ? translateFieldReplace($geoObj->data, 'name') : translate('tr_9a73b1e5b44bee481ab175b7e327451e'); ?>
            </span>
            <div class="uni-select-content">
                <div class="uni-select-content-container"></div>
            </div>
        </div>
        <?php if (!$geoObj && $myCityUrl) { ?>
            <div class="params-form-item-geo-sale-city-my">
                <a href="#" class="params-form-link-my-city actionAdSearchMyCity" data-geo-city-id="<?php echo (int)$myCity->id; ?>" data-geo-alias="<?php echo htmlspecialchars($myCityUrl); ?>">Искать в моем городе</a>
            </div>
        <?php } elseif ($geoObj && !empty($geoObj->city_id)) { ?>
            <div class="params-form-item params-form-item-switch params-form-item-geo-sale-city-delivery">
                <label class="switch">
                    <input type="checkbox" class="switch-input" id="ad-search-filter-city-with-delivery" name="filter[switch][city_with_delivery]" value="1" <?php echo !empty($sw['city_with_delivery']) ? 'checked=""' : ''; ?>>
                    <span class="switch-toggle-slider">
                        <span class="switch-on"></span>
                        <span class="switch-off"></span>
                    </span>
                    <span class="switch-label"><?php echo translate('tr_ad_search_city_include_delivery'); ?></span>
                </label>
            </div>
        <?php } ?>
    </div>
<?php } ?>

    <?php if (empty($geoObj) || empty($geoObj->city_id)) { ?>
    <div class="params-form-item params-form-item-switch">
        <label class="switch">
            <input type="checkbox" class="switch-input" name="filter[switch][delivery]" value="1" <?php echo (!empty($sw['delivery']) && empty($sw['city_with_delivery'])) ? 'checked=""' : ''; ?>>
            <span class="switch-toggle-slider">
                <span class="switch-on"></span>
                <span class="switch-off"></span>
            </span>
            <span class="switch-label"><?php echo translate('tr_ad_search_delivery_shipping'); ?></span>
        </label>
    </div>
    <?php } ?>
</div>
