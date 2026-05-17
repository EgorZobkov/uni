<?php

 /**
 * UniSite CMS
 * @link https://unisite.org
 * We are for a beautiful and fast code! Made with love!❤️
 */

 namespace App\Http\Controllers;

 use App\Systems\Controller;

 class HomeController extends Controller
 {

 public function __construct($app){
 parent::__construct($app); 
 }

 public function home()
{   

    if(isset($_GET["search"])){
        $q = trim((string)$_GET["search"]);
        if($q !== ""){
            $this->router->goToUrl(outRoute("global-search")."?".http_build_query(["search" => $_GET["search"]]));
            return;
        }
    }

    $this->asset->registerJs(["view"=>"web", "name"=>"<script src=\"{assets_path}/js/home.js?v=5\" type=\"module\" ></script>"]);

    $seo = $this->component->seo->content();
    
    return $this->view->render('home', ["seo"=>$seo]);

}

public function search()
{
    $this->asset->registerJs(["view"=>"web", "name"=>"<script src=\"{assets_path}/js/home.js?v=5\" type=\"module\" ></script>"]);

    $query = isset($_GET["search"]) ? trim((string)$_GET["search"]) : "";
    if($query){
        $this->component->search->fixingRequest($query, getFullURI(), $this->user->data->id);
    }
    $titleSuffix = $query ? " - " . $query : "";

    $seo = (object)[
        "meta_title" => "Поиск" . $titleSuffix,
        "meta_desc" => "Результаты глобального поиска" . $titleSuffix,
        "h1" => "",
        "text" => ""
    ];

    return $this->view->render('search', [
        "seo" => $seo,
        "query" => $query
    ]);
}

public function loadItems()
{   

    $content = '';
    $data = [];
    $ids = [];

    $page = isset($_POST["page"]) ? (int)$_POST["page"] : 1;
    if($page < 1) $page = 1;
    $search = isset($_POST["search"]) ? trim((string)$_POST["search"]) : "";

    $geo = $this->session->get("geo");

    $this->pagination->request($_POST);

    if($search){
        $build = $this->component->catalog->buildQuery(["search" => $search], 0, $geo);
        $data = $build ? $this->model->ads_data->pagination(true)->page($page)->output($this->settings->out_default_count_items_home)->sort("time_sorting desc")->getAll($build["query"], $build["params"]) : [];
    }else{
        $data = $this->model->ads_data->pagination(true)->page($page)->output($this->settings->out_default_count_items_home)->sort("time_sorting desc")->geo($geo)->getAll("status=?", [1]);
    }

    if($data){

        if($page <= $this->pagination->pages()){

            foreach ($data as $key => $value) {

                $value = $this->component->ads->getDataByValue($value);

                $ids[] = $value->id;

                $content .= $this->component->advertising->outInResults($key, ["col-grid"=>"col"]);

                $content .= $this->view->setParamsComponent(['value'=>$value])->includeComponent('items/home-grid.tpl');

            }

            $this->component->catalog->updateCountDisplay($ids);

        }

        if($page + 1 <= $this->pagination->pages()){

            $result = '
               <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" style="display: none;" >
                  '.$content.'
               </div>
               <div class="text-center" >
                  <button class="btn-custom mf-btn mf-btn-md mf-btn-primary button-color-scheme1 actionShowMoreItems" >'.translate("tr_11d9e7ea0320006d822a967777abd16a").'</button>
               </div>
            ';

        }else{
            $result = '
               <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" >
                  '.$content.'
               </div>
            ';
        }

    }else{
        if($geo){
            $result = '
               <div class="text-start" >
                  <p>'.translate("tr_65cd7b770f254b37e16a5187b91b0072").' "'.$geo->name.'" '.translate("tr_56952e12d9f7d5f3d0d08b34016f8fa8").'</p>
               </div>
            ';    
        }else{
            $result = '
               <div class="text-start" >
                  <p>'.translate("tr_698ee392dad3099a37dae5c98118fb2d").'</p>
               </div>
            ';
        }    
    }

    return json_answer(["content"=>$result]);

}



 }