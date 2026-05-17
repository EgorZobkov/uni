<div class="col h-100" >
  <a class="container-item-grid mf-card mf-card-product <?php if($value->service_highlight_status){ echo 'container-item-grid-highlight'; } ?>" href="<?php echo $app->component->ads->buildAliasesAdCard($value); ?>" >
    <div class="container-item-images mf-card-product__media" <?php echo $app->component->ads->setStyleHeightItemImage(); ?> >

      <?php echo $app->component->ads->outItemCardFavorite($value, $app->user->data->id) ?>

      <?php echo $app->component->ads->outMediaGalleryInCatalog($value); ?>

      <?php echo $app->component->ads->outLabelsInCatalog($value); ?>

    </div>
    <div class="container-item-grid-content mf-card-product__body" >
       <div class="container-item-grid-content-prices mf-card-product__price" ><?php echo $app->component->ads->outPrices($value); ?></div>
       <div class="container-item-grid-content-title mf-card-product__title" ><?php echo trimStr($value->title, 40, true); ?></div>
       <?php if($value->total_rating){ ?>
       <div class="container-item-grid-content-rating" ><?php echo $app->component->reviews->outInfoRatingByColor($value); ?></div>
       <?php } ?>
       <div class="container-item-grid-content-additionally mf-card-product__meta" >
         <span><?php echo $app->component->ads->outLocationByCatalog($value); ?></span>
         <span><?php echo $app->datetime->outLastTime($value->time_create); ?></span>

         <div class="container-item-grid-content-user" >
            <?php echo $app->component->profile->outFaceCard($value); ?>
         </div>
         
       </div>
    </div>
  </a>
</div>
