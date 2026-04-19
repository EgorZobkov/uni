<?php
$this->container->router->group($this->container->config->app->dashboard_alias, function($router) {

    $this->container->router->any('/ads/search', 'Dashboard/AdsSearchController@main', ['name' => 'dashboard-ads-search', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);
    $this->container->router->xpost('/ad/search/delete', 'Dashboard/AdsSearchController@delete', ['name' => 'dashboard-ad-search-delete', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);
    $this->container->router->xpost('/ad/search/load-card', 'Dashboard/AdsSearchController@loadCard', ['name' => 'dashboard-ad-search-load-card', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);
    $this->container->router->xpost('/ad/search/multi-change-status', 'Dashboard/AdsSearchController@changeMultiStatus', ['name' => 'dashboard-ad-search-multi-change-status', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);
    $this->container->router->xpost('/ad/search/multi-extend', 'Dashboard/AdsSearchController@multiExtend', ['name' => 'dashboard-ad-search-multi-extend', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);
    $this->container->router->xpost('/ad/search/multi-delete', 'Dashboard/AdsSearchController@multiDelete', ['name' => 'dashboard-ad-search-multi-delete', 'before' => ['DashboardMiddleware', 'DashboardTranslateMiddleware'], 'route_id'=>'dashboard-ads-search']);

}, ['dashboard'=>true]);
