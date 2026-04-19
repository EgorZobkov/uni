{% extends index.tpl %}

{% block content %}

<div class="container mt40 ad-search-create-page">

<h3 class="font-bold mb20">{{ $data->title }}</h3>

<div class="ad-create-options-container">

  <form class="form-ad-search-update">

  <div class="ad-create-content-container">
    {{ $template->component->ads->outAdSearchCreateFormFields($data); }}
  </div>

  <input type="hidden" name="ad_search_id" value="{{ $data->id }}">
  <input type="hidden" name="geo_city_id" value="{{ $data->city_id ?: '' }}">
  <input type="hidden" name="geo_address_latitude" value="">
  <input type="hidden" name="geo_address_longitude" value="">
  <input type="hidden" name="geo_latitude" value="">
  <input type="hidden" name="geo_longitude" value="">

  <button type="submit" class="btn-custom-big button-color-scheme3 adSearchActionUpdate mt30 mb30">{{ translate("tr_74ea58b6a801f0dce4e5d34dbca034dc") }}</button>

  </form>

</div>

</div>

{{ $template->component->geo->outMapChangeAddressInAdCreate(); }}

{% endblock %}
