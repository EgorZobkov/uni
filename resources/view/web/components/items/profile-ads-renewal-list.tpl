<div class="col-12" >
  <a class="profile-container-item-list mf-card mf-card-product mf-card-product--profile" href="<?php echo $app->component->ads->buildAliasesAdCard($value); ?>" >

    <div class="row" >

      <div class="col-lg-2 col-3" >
        
        <div class="profile-container-item-images mf-card-product__media" >

          <img src="<?php echo $value->media->images->first_m ?: $value->media->images->first; ?>" class="image-autofocus mf-card-product__image" alt="" >

        </div>

      </div>

      <div class="col-lg-8 col-7" >

        <div class="profile-container-item-list-content mf-card-product__body" >
           <div class="profile-container-item-list-content-status" ><?php echo $app->component->ads->outStatusByAd($value->status); ?></div>
           <div class="profile-container-item-list-content-title mf-card-product__title" >
                <?php echo $value->title; ?>
           </div>
           <div class="profile-container-item-list-content-info mf-card-product__meta" >
                <span><?php echo translate("tr_c1edf1d122e386bd5bc4d996d31b8248"); ?> <strong><?php echo $app->datetime->outStringDiff(null,$value->time_expiration); ?></strong> </span>
           </div>
        </div>
        
      </div>

      <div class="col-lg-2 col-2 text-end" >

        <div class="profile-button-item-delete mf-card-product__actions actionProfileDeleteRenewal" data-id="<?php echo $value->id; ?>" ><i class="ti ti-trash"></i></div>
        
      </div>

    </div>

  </a>
</div>
