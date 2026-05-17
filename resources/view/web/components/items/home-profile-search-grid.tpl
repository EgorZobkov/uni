<div class="col-md-6 col-6 col-sm-6 col-lg-3 h-100" >
  <a class="container-item-grid mf-card mf-card-product" href="<?php echo $app->component->ads->buildAliasesAdSearchCard($value); ?>" >
    <div class="container-item-images mf-card-product__media" <?php echo $app->component->ads->setStyleHeightItemImage(); ?> >

      <?php echo $app->component->ads->outMediaGalleryInCatalog($value); ?>

    </div>
    <div class="container-item-grid-content mf-card-product__body" >
       <?php if($app->user->data->id == $value->user_id){ ?>
       <div class="container-item-grid-content-status" ><?php echo $app->component->ads->outStatusByAd($value->status); ?></div>
       <?php } ?>
       <div class="container-item-grid-content-title mf-card-product__title" ><?php echo trimStr($value->title, 40, true); ?></div>
    </div>
  </a>
</div>
