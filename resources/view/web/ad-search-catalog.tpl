{% extends index.tpl %}

{% block content %}

<div class="container mt20 ad-search-catalog-page">

  <nav aria-label="breadcrumb" class="mb15">
    <ol class="breadcrumb" itemscope="" itemtype="http://schema.org/BreadcrumbList">
      <li class="breadcrumb-item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{{ outLink(); }}">
          <span itemprop="name">{{ translate("tr_047f5653b183292396e67f14c8750b73") }}</span></a>
        <meta itemprop="position" content="1">
      </li>
      <li class="breadcrumb-item active" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
        <span itemprop="name">{{ $seo->h1; }}</span>
        <meta itemprop="position" content="2">
      </li>
    </ol>
  </nav>

  <h1 class="font-bold mb20">{{ $seo->h1; }}</h1>

  <div class="row mt25">
    <div class="col-lg-3 d-none d-lg-block">
      <div class="catalog-sidebar">
        <form class="params-form ad-search-live-filters params-form-sticky" method="get" action="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}">
          {{ $template->component->ads->outAdsSearchCatalogSidebar($_GET); }}
          <div class="params-buttons-sticky">
            <button type="submit" class="btn-custom button-color-scheme1 width100">{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>
            {% if(!empty($_GET["filter"])): %}
            <a class="btn-custom button-color-scheme3 width100 mt5 d-inline-block text-center" href="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}">{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</a>
            {% endif %}
          </div>
        </form>
      </div>
    </div>

    <div class="col-12 col-lg-9">
      <div class="catalog-container-options">
        <div class="row">
          <div class="col-md-6 col-12"></div>
          <div class="col-md-6 col-12 text-end">
            <div class="catalog-container-options-links-inline catalog-container-options-links-inline-sorting">
              <div>{{ $template->component->ads->outAdsSearchCatalogSorting(); }}</div>
            </div>
          </div>
        </div>
      </div>

      <div class="container-load-items mt30">
        <div class="row g-2 g-lg-3">
          {% component items/skeleton-search-wanted.tpl %}
        </div>
      </div>
    </div>
  </div>
</div>

{% endblock %}
