{% extends index.tpl %}

{% block content %}

<div class="container mt40 ad-search-create-page">

<h3 class="font-bold mb20">{{ $seo->h1; }}</h3>

<div class="ad-create-options-container">

  <form class="form-ad-search-create">

  <div class="ad-create-content-container">
    {{ $template->component->ads->outAdSearchCreateFormFields(); }}
  </div>

  <input type="hidden" name="geo_city_id" value="{{ $template->user->data->city_id ?: '' }}">
  <input type="hidden" name="geo_address_latitude" value="">
  <input type="hidden" name="geo_address_longitude" value="">
  <input type="hidden" name="geo_latitude" value="">
  <input type="hidden" name="geo_longitude" value="">

  <button type="submit" class="btn-custom-big button-color-scheme3 adSearchActionPublication mt30 mb30">{{ translate("tr_e9c3a648ce9e5dcf3c96940e682a72a2") }}</button>

  </form>

</div>

</div>

{{ $template->component->geo->outMapChangeAddressInAdCreate(); }}

{% endblock %}
