{% extends index.tpl %}

{% block content %}

<div class="container ds-flow-page-start-xl">

<div class="ds-stack-24">
<h3 class="font-bold" >{{ $seo->h1; }}</h3>

<div class="ad-create-categories-container" >
  
    <div class="row" >
      <div class="col-md-4" >

        <div class="ad-create-categories-container-items" >{{ $template->component->ads_categories->outMainCategoriesInAdCreate(); }}</div>

      </div>
    </div>

</div>

</div>

<div class="ad-create-options-container" >

  <form class="form-ad-create mf-form ds-stack-32" >

  <div class="ad-create-content-container" >
  </div>

  <input type="hidden" name="category_id" value="" >
  <input type="hidden" name="geo_city_id" value="{{ $template->user->data->city_id ?: '' }}" >
  <input type="hidden" name="geo_address_latitude" value="" >
  <input type="hidden" name="geo_address_longitude" value="" >
  <input type="hidden" name="geo_latitude" value="" >
  <input type="hidden" name="geo_longitude" value="" >

  <div class="mf-form-actions" >
  <button class="btn-custom-big mf-btn mf-btn-lg mf-btn-dark adActionPublication" >{{ translate("tr_e9c3a648ce9e5dcf3c96940e682a72a2") }}</button>
  </div>

  </form>

</div>

</div>

{{ $template->component->geo->outMapChangeAddressInAdCreate(); }}

{% endblock %}