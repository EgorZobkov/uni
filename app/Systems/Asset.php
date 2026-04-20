<?php

/**
 * UniSite CMS
 * @link    https://unisite.org
 * We are for a beautiful and fast code! Made with love!❤️
 */

namespace App\Systems;

class Asset{

    public static $assets = [];

    public function __construct(){
        if(file_exists(BASE_PATH . '/config/assets.php')) {
            $data = require BASE_PATH . '/config/assets.php';
            if(is_array($data)){
                static::$assets = $data;
            }
        }
    }

    public static function registerJs($params=[]){
        if(count($params)){
            if(isset($params['view'])){
                if(isset($params['name'])){
                    static::$assets[$params['view']]['js'][] = $params['name'];
                }
            }
        }
    }

    public static function registerCss($params=[]){
        if(count($params)){
            if(isset($params['view'])){
                if(isset($params['name'])){
                    static::$assets[$params['view']]['css'][] = $params['name'];
                }
            }
        }
    }

    public static function getJs($view=null){
        $resource = require BASE_PATH . '/config/resource.php';
        if(isset(static::$assets[$view]['js'])) {
            $result = str_replace(
                ["{assets_path}","{resources_path}"],
                [isset($resource["assets"][$view]["base"]) ? resource(null,$resource["assets"][$view]["base"]) : '', resource(null,$resource["path"])],
                implode("\n", static::$assets[$view]['js'])
            );

            global $app;
            if($view === 'web' && isset($app->router->currentRoute->name) && $app->router->currentRoute->name === 'home'){
                $result = preg_replace_callback('/<script\b([^>]*)data-home-lazy="1"([^>]*)><\/script>/i', function($matches){
                    $attributes = $matches[1] . ' ' . $matches[2];
                    $src = '';
                    $type = 'text/javascript';

                    if(preg_match('/\ssrc="([^"]+)"/i', $attributes, $srcMatch)){
                        $src = $srcMatch[1];
                    }
                    if(preg_match('/\stype="([^"]+)"/i', $attributes, $typeMatch)){
                        $type = $typeMatch[1];
                    }

                    if(!$src){
                        return '';
                    }

                    return '<script data-home-lazy-script="1" data-src="' . htmlspecialchars($src, ENT_QUOTES, 'UTF-8') . '" data-type="' . htmlspecialchars($type, ENT_QUOTES, 'UTF-8') . '"></script>';
                }, $result);
            }

            return $result;
        }
    }

    public static function getCss($view=null){
        $resource = require BASE_PATH . '/config/resource.php';
        if(isset(static::$assets[$view]['css'])) {
            return str_replace(["{assets_path}","{resources_path}"],[isset($resource["assets"][$view]["base"]) ? resource(null,$resource["assets"][$view]["base"]) : '',resource(null,$resource["path"])],implode("\n",static::$assets[$view]['css']));
        }
    }

}