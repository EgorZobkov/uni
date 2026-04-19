public function deleteMedia($media=null){
    global $app;

    if($media){

        foreach ($media["inline"] as $key => $value) {
            
            if($value["type"] == "image"){
                $app->storage->path('market-images')->name($value["folder"].'/'.$value["name"])->delete();
                $nameBase = pathinfo($value["name"], PATHINFO_FILENAME);
                $app->storage->path('market-images')->name($value["folder"].'/'.$nameBase.'_m.webp')->delete();
            }elseif($value["type"] == "video"){
                $app->storage->path('market-video')->name($value["folder"].'/'.$value["name"])->delete();
                $app->storage->path('market-images')->name($value["folder"].'/'.$value["preview"])->delete();
            }
            
        }
    }

}