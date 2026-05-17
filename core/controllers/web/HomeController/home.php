public function home()
{   

    $this->asset->registerJs(["view"=>"web", "name"=>"<script src=\"{assets_path}/js/home.js?v=5\" type=\"module\" ></script>"]);

    $seo = $this->component->seo->content();
    
    return $this->view->render('home', ["seo"=>$seo]);

}