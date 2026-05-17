<div class="col-12 col-md-6 col-lg-4">

  <a class="home-search-grid-card-link mf-card" href="<?php echo $app->component->ads->buildAliasesAdSearchCard($value); ?>">

  <div class="container-item-search-grid mf-card-product mf-card-product--compact mf-card-product--horizontal">

    <div class="container-item-search-image">

      <div class="container-item-images mf-card-product__media">

        <?php echo $app->component->ads->outMediaGalleryInCatalog($value); ?>

      </div>

    </div>

    <div class="container-item-search-content mf-card-product__body">

      <div class="container-item-search-top">

        <div class="container-item-search-title mf-card-product__title">

          <?php echo trimStr($value->title, 60, true); ?>

        </div>

      </div>

      <div class="container-item-search-bottom">

        <div class="container-item-grid-content-user">

          <?php echo $app->component->profile->outFaceCard($value); ?>

        </div>

        <div class="container-item-search-meta mf-card-product__meta">

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

