public function outMediaGalleryInCatalog($value=[]){
    global $app;

    $catalogImages = $value->media->images->all_m ?: $value->media->images->all;

    if($catalogImages){
      foreach (array_slice($catalogImages, 0,10) as $key => $link) {
        ?>
        <img src="<?php echo $link; ?>" data-key="<?php echo $key; ?>" alt="<?php echo $value->title; ?>" class="image-autofocus" loading="lazy" >
        <?php
      }

      if(count($catalogImages) > 1){
        ?>
          <div class="container-item-images-indicator" >
              <?php
              foreach (array_slice($catalogImages, 0,10) as $key => $link) {
                ?>
                <span data-key="<?php echo $key; ?>" style="height: <?php echo $app->settings->board_catalog_height_item-2; ?>px" ></span>
                <?php
              }
              ?>
          </div>
        <?php
      }

    }else{
        ?>
        <img src="<?php echo $app->storage->noImage(); ?>" alt="<?php echo $value->title; ?>" class="image-autofocus" loading="lazy" >
        <?php
    }
    
}