<?php
$adSearch = (isset($adSearch) && is_object($adSearch)) ? $adSearch : null;
if ($adSearch) {
    $geoRow = $adSearch->geo ?? null;
    $user_city_name = $geoRow ? $app->component->geo->outFullNameCity((array)$geoRow) : '';
    $map_city_id = (int)($adSearch->city_id ?? 0);
} else {
    $user_city = $app->user->data->city_id ? $app->component->geo->getCityData($app->user->data->city_id) : null;
    $user_city_name = $user_city ? $app->component->geo->outFullNameCity((array)$user_city) : null;
    $map_city_id = $user_city ? $user_city->id : 0;
}
$title_val = $adSearch ? (string)$adSearch->title : '';
$text_val = $adSearch ? (string)$adSearch->text : '';
$price_val = $adSearch && isset($adSearch->price) ? $adSearch->price : '';
$delivery_checked = ($adSearch && !empty($adSearch->delivery_shipping_status)) ? ' checked=""' : '';
?>
<div class="row">
  <div class="col-md-6 order-lg-1 order-2">

    <div class="ad-create-options-container-item mf-form-section">
      <h5 class="ad-create-options-container-item-title"><strong><?php echo translate("tr_33ea34d8ad8f8fb23396552ee810fa9e"); ?></strong></h5>
      <input type="text" name="title" class="form-control" value="<?php echo htmlspecialchars($title_val, ENT_QUOTES, 'UTF-8'); ?>">
      <label class="form-label-error" data-name="title"></label>
    </div>

    <div class="ad-create-options-container-item mf-form-section">
      <h5 class="ad-create-options-container-item-title"><strong><?php echo translate("tr_38ca0af80cd7bd241500e81ba2e6efff"); ?></strong></h5>
      <textarea name="text" class="form-control-textarea"><?php echo htmlspecialchars($text_val, ENT_QUOTES, 'UTF-8'); ?></textarea>
      <label class="form-label-error" data-name="text"></label>
    </div>

    <div class="ad-create-options-container-item mf-form-section">
      <h5 class="ad-create-options-container-item-title"><strong><?php echo translate("tr_c24797c4abfb4ebe54dc45b9e411ac3a"); ?></strong></h5>
      <p><?php echo translate("tr_25fb5a4c68afb45e682bcfa595f905c2"); ?></p>
      <div class="init-unidropzone unidropzone sortable">
        <?php if($app->settings->board_publication_add_video_status){ ?>
        <div class="unidropzone-change"><?php echo translate("tr_b760653ac17f261ac6679ad14f732a95"); ?></div>
        <input type="file" name="unidropzone_files[]" multiple="multiple" <?php echo $app->ui->outAcceptUploadFormatFiles("multiple"); ?>>
        <?php }else{ ?>
        <div class="unidropzone-change"><?php echo translate("tr_666c01d719f2cb6ba604618e5783bbbe"); ?></div>
        <input type="file" name="unidropzone_files[]" multiple="multiple" <?php echo $app->ui->outAcceptUploadFormatFiles("image"); ?>>
        <?php } ?>
        <div class="unidropzone-container unidropzone-container-show">
          <?php if ($adSearch) {
              $app->component->ads->outMediaInEditAd($adSearch);
          } ?>
        </div>
      </div>
      <label class="form-label-error" data-name="media"></label>
      <input type="text" name="link_video" class="form-control" placeholder="<?php echo translate("tr_662d6fb048aed921e26d9d9de4c18124"); ?>" value="">
    </div>

    <div class="ad-create-options-container-item mf-form-section">
      <h5 class="ad-create-options-container-item-title"><strong><?php echo translate("tr_ad_search_price_up_to"); ?></strong></h5>
      <div class="row">
        <div class="col-md-6">
          <input type="number" name="price" class="form-control" value="<?php echo htmlspecialchars((string)$price_val, ENT_QUOTES, 'UTF-8'); ?>" step="0.01" placeholder="">
        </div>
      </div>
      <label class="form-label-error" data-name="price"></label>
    </div>

    <?php if($app->settings->active_countries){ ?>
    <div class="ad-create-options-container-item mf-form-section">
      <h5 class="ad-create-options-container-item-title"><strong><?php echo translate("tr_06d897a2b68c63493b65390fe35e7a2a"); ?></strong></h5>
      <div class="row">
        <div class="col-md-6"><label class="form-control-label"><?php echo translate("tr_ad_search_city_purchase"); ?></label></div>
        <div class="col-md-6">
          <div class="input-geo-search-container ad-create-search-city">
            <input type="text" class="form-control" placeholder="<?php echo translate("tr_8121328feb04392a48af5bfd7d1138d8"); ?>" value="<?php echo htmlspecialchars((string)($user_city_name ?: ''), ENT_QUOTES, 'UTF-8'); ?>">
            <div class="input-geo-search-container-result"></div>
          </div>
          <label class="form-label-error" data-name="geo_city_id"></label>
        </div>
      </div>
      <div class="ad-create-options-container-item-extra">
        <label class="switch">
          <input type="checkbox" class="switch-input" name="delivery_shipping_status" value="1"<?php echo $delivery_checked; ?>>
          <span class="switch-toggle-slider">
            <span class="switch-on"></span>
            <span class="switch-off"></span>
          </span>
          <span class="switch-label"><?php echo translate("tr_ad_search_delivery_shipping"); ?></span>
        </label>
      </div>
    </div>
    <div class="ad-create-options-container-item-box-geo" <?php echo $map_city_id ? 'style="display: block;"' : 'style="display: none;"'; ?>>
      <?php echo $app->component->ads->outMapAndOptionsInAdCreate($map_city_id, null); ?>
    </div>
    <?php } ?>

  </div>
  <div class="col-md-4 order-lg-2 order-1"></div>
</div>
