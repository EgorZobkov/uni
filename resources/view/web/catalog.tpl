{% extends index.tpl %}

{% block head %}
<link rel="canonical" href="{{ $template->component->ads_categories->buildAliases((array)($template->component->catalog->data->category ?? [])) }}"/>
{% endblock %}

{% block content %}

<div class="container ds-flow-page-start" >

<div class="row" >

  <div class="col-lg-12 ds-stack-24" >

    <header class="mf-page-header" aria-labelledby="catalog-page-title" >

    <div class="mf-page-header__nav" >
    <nav aria-label="breadcrumb" >

      <ol class="breadcrumb" itemscope="" itemtype="http://schema.org/BreadcrumbList">

        <li class="breadcrumb-item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
          <a itemprop="item" href="{{ outLink(); }}">
          <span itemprop="name">{{ translate("tr_047f5653b183292396e67f14c8750b73") }}</span></a>
          <meta itemprop="position" content="1">
        </li>

        {% if($template->component->catalog->data->category): %}
        {{ $template->component->catalog->outBreadcrumb(); }}
        {% else: %}
        <li class="breadcrumb-item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
          <span itemprop="name">{{ $seo->h1; }}</span>
          <meta itemprop="position" content="2">
        </li>
        {% endif %}

      </ol>

    </nav>
    </div>

    <h1 id="catalog-page-title" class="mf-page-header__title font-bold" >{{ $seo->h1; }}</h1>

    </header>

    {% if(!$template->component->catalog->data->category): %}
    <section class="mf-catalog-categories" >
      <div class="widget-categories-container mf-home-hero__categories mf-home-hero__categories-track mf-categories-strip mf-catalog-categories-track mf-categories-strip--compact" >
        {{ $template->component->ads_categories->outCategoriesOrSubCategoriesByCatalog(); }}
        <a href="#" role="button" class="home-widget-categories-item mf-home-hero__category-more actionOpenStaticModal d-none" data-modal-target="homeCategories" aria-label="{{ translate('tr_home_categories_more') }}" >
          <span class="mf-home-hero__category-more-icon" aria-hidden="true"><i class="ti ti-layout-grid"></i></span>
          <div>{{ translate('tr_home_categories_more') }}</div>
        </a>
      </div>
    </section>
    {% endif %}

    {% if($template->component->catalog->data->category): %}
    {{ $template->component->catalog->outPromoBanners() }}
    {% endif %}

    {{ $template->component->ads_filters->outFilterLinks() }}

    <div class="row mf-catalog-layout ds-flow-section" >
      
      <div class="mf-catalog-layout__sidebar col-12 d-none d-lg-block" >
        
        <div class="catalog-sidebar" >

          <form class="params-form live-filters params-form-sticky mf-form ds-stack-16" >
          {{ $template->component->catalog->buildParamsForm($_GET, $template->component->catalog->data->category ? $template->component->catalog->data->category->id : 0); }}

          <div class="params-buttons-sticky" >
            
            {{ $template->component->ads_filters->outButtonExtraFilters($template->component->catalog->data->category ? $template->component->catalog->data->category->id : 0) }}
            
            <button class="btn-custom mf-btn mf-btn-md mf-btn-primary width100 actionApplyLiveFilters" >{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>

            {% if($_GET["filter"]): %}
            <button class="btn-custom mf-btn mf-btn-md mf-btn-dark width100 actionClearLiveFilters">{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</button>
            {% endif %}

          </div>

          </form>

        </div>

      </div>

      <div class="mf-catalog-layout__main col-12" >

        <div class="catalog-container-options mf-toolbar catalog-container-options--sort-only" >
          <div class="catalog-container-options-sort-only" >
            {{ $template->component->catalog->outLinkSorting(); }}
          </div>
        </div>
        <div class="container-load-items ds-flow-section-lg" >
          
          <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3" >
            {% component items/skeleton.tpl %}
          </div>

        </div>

      </div>

    </div>

     {% if($seo->h2): %}
         <section class="home-seo-text mf-section-header mf-section-header--flush ds-stack-16 ds-flow-section-lg" >
            <h2 class="font-bold" >{{ $seo->h2 }}</h2>
            {{ $seo->text }}
         </section>
     {% endif %}

  </div>


</div>

</div>

{{ $template->ui->tpl('modals/extra-filters-modal.tpl')->modal("extraFilters", "medium", ["filters"=>$_GET["filter"], "category_id"=>$template->component->catalog->data->category ? $template->component->catalog->data->category->id : 0]) }}

{% endblock %}
