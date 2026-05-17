{% extends index.tpl %}

{% block content %}

<div class="container ds-flow-page-start-xl ad-search-create-page">

<div class="ds-stack-24">

<h3 class="font-bold">{{ $data->title }}</h3>

<div class="ad-create-options-container">

  <form class="form-ad-search-update mf-form ds-stack-32">

  <div class="ad-create-content-container">
    {{ $template->component->ads->outAdSearchCreateFormFields($data); }}
  </div>

  <input type="hidden" name="ad_search_id" value="{{ $data->id }}">
  <input type="hidden" name="geo_city_id" value="{{ $data->city_id ?: '' }}">
  <input type="hidden" name="geo_address_latitude" value="">
  <input type="hidden" name="geo_address_longitude" value="">
  <input type="hidden" name="geo_latitude" value="">
  <input type="hidden" name="geo_longitude" value="">

  <div class="mf-form-actions">
  <button type="submit" class="btn-custom-big mf-btn mf-btn-lg mf-btn-dark adSearchActionUpdate">{{ translate("tr_74ea58b6a801f0dce4e5d34dbca034dc") }}</button>
  </div>

  </form>

</div>

</div>

</div>

{{ $template->component->geo->outMapChangeAddressInAdCreate(); }}

{% endblock %}
