<div class="col h-100" >
  <a class="container-item-grid mf-card mf-card-product" href="<?php echo $app->component->ads->buildAliasesAdCard($value); ?>" >
    <div class="container-item-images mf-card-product__media" <?php echo $app->component->ads->setStyleHeightItemImage(); ?> >

      <?php echo $app->component->ads->outItemCardFavorite($value, $app->user->data->id) ?>

      <?php echo $app->component->ads->outMediaGalleryInCatalog($value); ?>

    </div>
    <div class="container-item-grid-content mf-card-product__body" >
       <div class="container-item-grid-content-prices mf-card-product__price" ><?php echo $app->component->ads->outPrices($value); ?></div>
       <div class="container-item-grid-content-title mf-card-product__title" ><?php echo trimStr($value->title, 40, true); ?></div>
    </div>
  </a>
</div>
