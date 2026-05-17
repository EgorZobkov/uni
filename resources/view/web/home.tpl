{% extends index.tpl %}

{% block head %}
<meta property="og:image" content="{{ $template->storage->logo() }}">
{% endblock %}

{% block content %}

<div class="container ds-flow-page-start-sm mf-home-page" >

<div class="row" >

 <div class="col-md-12" >

   <div class="home-widget-sections"  >

     {% foreach($template->component->settings->getFrontendHomeWidgets() as $value): %}
     
         {% if($value["code"] == "slider_categories"): %}

      <section class="mf-home-hero" aria-label="{{ translate('tr_header_global_search_placeholder') }}" >
        <div class="mf-home-hero__inner ds-stack-16" >
          <form class="mf-home-hero__search" method="get" action="{{ outRoute('home') }}" role="search" >
            <input type="search" name="search" class="mf-input form-control mf-home-hero__search-input" autocomplete="off" placeholder="{{ translate('tr_header_global_search_placeholder') }}" value="" >
            <button type="submit" class="btn-custom mf-btn mf-btn-md mf-btn-primary button-color-scheme1 mf-home-hero__search-submit" aria-label="{{ translate('tr_home_hero_find') }}" ><i class="ti ti-search" aria-hidden="true"></i></button>
          </form>
          <div class="widget-categories-container mf-home-hero__categories mf-home-hero__categories-track mf-categories-strip mf-categories-strip--compact" >
            {{ $template->component->home->outCategories() }}
            <a href="#" role="button" class="home-widget-categories-item mf-home-hero__category-more actionOpenStaticModal d-none" data-modal-target="homeCategories" aria-label="{{ translate('tr_home_categories_more') }}" >
              <span class="mf-home-hero__category-more-icon" aria-hidden="true"><i class="ti ti-layout-grid"></i></span>
              <div>{{ translate('tr_home_categories_more') }}</div>
            </a>
          </div>
        </div>
      </section>

      <section class="widget-ads-search-container" >
        {{ $template->component->home->outAdsSearch() }}
      </section>



         {% endif %}

         {% if($value["code"] == "promo_banners"): %}

         <section class="widget-promo-banners-container" >{{ $template->component->home->outPromoBanners() }}</section>

         {% endif %}

         {% if($value["code"] == "shops"): %}

         <section class="widget-shops-container" >{{ $template->component->home->outShops() }}</section>

         {% endif %}

         {% if($value["code"] == "articles_blog"): %}

         <section class="widget-articles-blog-container" >{{ $template->component->home->outArticlesBlog() }}</section>

         {% endif %}

         {% if($value["code"] == "ads_categories"): %}

        <section class="widget-ads-categories-container" >{{ $template->component->home->outAdsByCategories() }}</section>

         {% endif %}

         {% if($value["code"] == "vip_ads"): %}

         <section class="widget-ads-vip-container" >{{ $template->component->home->outAdsVip() }}</section>

         {% endif %}

         {% if($value["code"] == "ads"): %}

         <section class="widget-ads-container" >

            <header class="mf-section-header mf-section-header--flush" >
            <div class="bold-title-and-link" >
               <span>{{ translate("tr_a0825e8ab6d3fdb685be22c1c21d9ebc") }}</span>
               <a class="bold-title-and-link__all" href="{{ $template->component->home->hrefSalesCatalogRoot() }}" >{{ translate("tr_1cc7e7972b8c9daa5e9c8e94483acc7d") }}</a>
            </div>
            </header>

            <div class="container-load-items" >
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" >
                  {% component items/skeleton-col5.tpl %}
                </div>
            </div>

         </section>

         {% endif %}

     {% endforeach %}

     {% if($seo->h1): %}
         <section class="home-seo-text ds-stack-16" >
            <h1 class="font-bold" >{{ $seo->h1 }}</h1>
            {{ $seo->text }}
         </section>
     {% endif %}

   </div>

 </div>

</div>

</div>

{% endblock %}