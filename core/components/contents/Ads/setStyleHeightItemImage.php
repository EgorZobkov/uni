public function setStyleHeightItemImage(){
    global $app;
    $h = (int) $app->settings->board_catalog_height_item;
    if ($h < 120) $h = 225;
    if ($h > 640) $h = 640;
    return 'style="--ds-catalog-thumb-max:'.$h.'px"';
}