<div class="col-12 col-md-6 col-lg-4">
  <a class="home-search-grid-card-link" href="<?php echo $app->component->ads->buildAliasesAdSearchCard($value); ?>">
  <div class="container-item-search-grid">
    <div class="container-item-search-image">
      <div class="container-item-images" style="height: 105px;">
        <?php echo $app->component->ads->outMediaGalleryInCatalog($value); ?>
      </div>
    </div>
    <div class="container-item-search-content">
      <div class="container-item-search-title">
        <?php echo trimStr($value->title, 60, true); ?>
      </div>
      <div class="container-item-search-bottom">
        <div class="container-item-grid-content-user">
          <?php echo $app->component->profile->outFaceCard($value); ?>
        </div>
        <div class="container-item-search-meta">
          <span class="container-item-search-shipping <?php echo !empty($value->delivery_shipping_status) ? 'is-available' : 'is-unavailable'; ?>" aria-hidden="true">
            <span class="container-item-search-shipping-icon"></span>
          </span>
          <span class="container-item-search-location">
            <?php echo $app->component->ads->outLocationByCatalog($value); ?>
          </span>
        </div>
      </div>
    </div>
  </div>
  </a>
</div>
