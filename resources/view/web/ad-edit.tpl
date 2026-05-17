{% extends index.tpl %}

{% block content %}

<div class="container ds-flow-page-start-xl" >

<div class="ds-stack-24">

<h3 class="font-bold" >{{ $data->title }}</h3>

<div class="ad-create-categories-container" style="display: none;" >
  
    <div class="row" >
      <div class="col-md-4" >

        <div class="ad-create-categories-container-items" ><button class="btn-custom button-color-scheme2 mb15 ad-create-categories-close" >{{ translate("tr_2b0b0225a86bb67048840d3da9b899bc") }}</button> {{ $template->component->ads_categories->outMainCategoriesInAdCreate() }}</div>

      </div>
    </div>

</div>

<div class="ad-create-options-container" style="display: block;" >

  <form class="form-ad-update mf-form ds-stack-32" >

  <div class="ad-create-content-container" >
      {{ $template->component->ads->getContentAndOptions(["category_id"=>$data->category_id, "is_admin"=>$data->isAdmin],$data) }}
  </div>

  <input type="hidden" name="ad_id" value="{{ $data->id }}" >
  <input type="hidden" name="category_id" value="{{ $data->category_id }}" >
  <input type="hidden" name="geo_city_id" value="{{ $data->city_id }}" >
  <input type="hidden" name="geo_address_latitude" value="{{ $data->address_latitude }}" >
  <input type="hidden" name="geo_address_longitude" value="{{ $data->address_longitude }}" >
  <input type="hidden" name="geo_latitude" value="{{ $data->address_latitude ?: $data->geo_latitude }}" >
  <input type="hidden" name="geo_longitude" value="{{ $data->address_longitude ?: $data->geo_longitude }}" >

  <div class="mf-form-actions" >
  <button class="btn-custom-big mf-btn mf-btn-lg mf-btn-dark adActionUpdate" >{{ translate("tr_74ea58b6a801f0dce4e5d34dbca034dc") }}</button>
  </div>

  </form>

</div>

</div>

</div>

{{ $template->component->geo->outMapChangeAddressInAdCreate() }}

{% endblock %}