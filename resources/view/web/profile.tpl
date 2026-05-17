{% extends index.tpl %}



{% block content %}



<div class="container ds-flow-page-start" >



<div class="row" >



  <div class="col-12 col-md-3 profile-home-sidebar-wrap" >



    {% component profile/sidebar.tpl %}



  </div>



  <div class="col-12 col-md-9" >



    <div class="profile-home-sections ds-stack-32" >



      <section class="ds-stack-16">



        {% if($template->settings->verification_users_status): %}



          {% if(!$template->user->data->verification_status): %}



          {% else: %}



          <div class="profile-home-sections-info-item">

          <h5> <strong>{{ translate("tr_8b172472598ea96545ea248dd2b60d0e") }}</strong> </h5>

          </div>



          {% endif %}



        {% endif %}







      </section>



      {% if($data->orders): %}

      <section class="ds-stack-16">

      <header class="mf-section-header mf-section-header--flush">

        <div class="mf-section-header__row mf-section-header__row--split">

          <h3 class="mf-section-header__title"> <strong>{{ translate("tr_0905527faec7de502c0e62ce318af892") }}</strong> </h3>

          <div class="mf-section-header__actions">

            <a class="btn-custom-mini mf-btn mf-btn-sm mf-btn-secondary" href="{{ outRoute('profile-orders') }}" >{{ translate("tr_4afd2ca38e5bba8fb023f3bce3e22838") }}</a>

          </div>

        </div>

      </header>

      <div class="row row-cols-2 g-2 g-lg-3" >{{ $data->orders }}</div>

      </section>

      {% endif %}



      <section class="ds-stack-16">

        {% if($data->ads): %}

          <header class="mf-section-header mf-section-header--flush">

            <div class="mf-section-header__row mf-section-header__row--split">

              <h3 class="mf-section-header__title"> <strong>{{ translate("tr_ffc009f302516a8402667d060e48794b") }}</strong> </h3>

              <div class="mf-section-header__actions">

                <a class="btn-custom mf-btn mf-btn-md mf-btn-primary" href="{{ outRoute('ad-create') }}" >{{ translate("tr_6a597fed338ace644982313b3cfbead4") }}</a>

              </div>

            </div>

          </header>



          <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" >{{ $data->ads; }}</div>



        {% else: %}

          <header class="mf-section-header mf-section-header--flush">

            <div class="mf-section-header__row mf-section-header__row--split">

              <h3 class="mf-section-header__title"> <strong>{{ translate("tr_698ee392dad3099a37dae5c98118fb2d") }}</strong> </h3>

              <div class="mf-section-header__actions">

                <a class="btn-custom mf-btn mf-btn-md mf-btn-primary" href="{{ outRoute('ad-create') }}" >{{ translate("tr_6a597fed338ace644982313b3cfbead4") }}</a>

              </div>

            </div>

          </header>

        {% endif %}

      </section>



      {% if($data->show_ads_search_block): %}

      <section class="ds-stack-16">

        <header class="mf-section-header mf-section-header--flush">

          <div class="mf-section-header__row mf-section-header__row--split">

            <h3 class="mf-section-header__title"> <strong>{{ translate("tr_profile_block_looking_for") }}</strong> </h3>

            <div class="mf-section-header__actions">

              <a class="btn-custom mf-btn mf-btn-md mf-btn-primary" href="{{ outRoute('ad-search-create') }}" >{{ translate("tr_header_add_type_search") }}</a>

            </div>

          </div>

        </header>



        <div class="row row-cols-2 g-2 g-lg-3" >{{ $data->ads_search; }}</div>

      </section>

      {% endif %}



      {% if($data->favorites): %}

      <section class="ds-stack-16">

      <header class="mf-section-header mf-section-header--flush">

        <h3 class="mf-section-header__title"> <strong>{{ translate("tr_2fc413929104c1a09ae0a66c48ce0902") }}</strong> </h3>

      </header>

      <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3" >{{ $data->favorites }}</div>

      </section>

      {% endif %}



      {% if($data->reviews): %}

      <section class="ds-stack-16">

      <header class="mf-section-header mf-section-header--flush">

        <div class="mf-section-header__row mf-section-header__row--split">

          <h3 class="mf-section-header__title"> <strong>{{ translate("tr_1c3fea01a64e56bd70c233491dd537aa") }}</strong> </h3>

          <div class="mf-section-header__actions">

            <a class="btn-custom-mini mf-btn mf-btn-sm mf-btn-secondary" href="{{ outRoute('profile-reviews') }}" >{{ translate("tr_4fbf45456be84d545b8a3052079e0173") }}</a>

          </div>

        </div>

      </header>

      <div class="row row-cols-2 g-2 g-lg-3" >{{ $data->reviews }}</div>

      </section>

      {% endif %}



    </div>



  </div>



</div>



</div>



{% if($template->settings->registration_bonus_status): %}

{{ $template->ui->tpl('modals/profile-registration-bonus.tpl')->modal("profileRegistrationBonus", "small") }}

{% endif %}



{% endblock %}

