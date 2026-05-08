{% extends index.tpl %}

{% block head %}
<meta property="og:image" content="{{ $template->storage->logo() }}">
{% endblock %}

{% block content %}

<div class="container mt15" >

<div class="row" >

 <div class="col-md-12" >

   <div class="home-widget-sections" >

      <section class="widget-search-title-container" >
         <h1 class="font-bold mb15" >Результаты поиска: {{ $query ? $query : '-' }}</h1>
      </section>

      <section class="widget-ads-search-container" >
         {{ $template->component->home->outAdsSearch($query, "Покупают", false) }}
      </section>

      <section class="widget-ads-container" >
         <div class="bold-title-and-link" >
            <span>Продают</span>
         </div>

         <div class="container-load-items" >
            <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" >
               {% component items/skeleton-col5.tpl %}
            </div>
         </div>
      </section>

   </div>

 </div>

</div>

</div>

{% endblock %}
