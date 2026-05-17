<header {% if($template->view->visible_header): %} class="header-visible-height d-none d-lg-block mf-desktop-header mf-desktop-header--masthead" {% else: %} class="header-hidden-height d-none d-lg-block mf-desktop-header mf-desktop-header--minimal" {% endif %} >
<div class="header-wow" >

   {% if($template->view->visible_header): %}

   <div class="header-wow-sticky mf-site-header-sticky" >
       <div class="header-wow-sticky-container mf-site-header-sticky__container" >

        <div class="mf-site-header" role="banner" >
        <div class="container-fluid mf-site-header__container" >
            <div class="mf-site-header__inner" >
                <div class="mf-site-header__brand" >
                      <div class="header-button-menu-catalog open-header-menu-catalog mf-site-header__catalog-btn mf-site-header__omit" >
                          <span class="header-button-menu-catalog-icon-1 mf-site-header__catalog-icon" ><i class="ti ti-category"></i></span>
                          <span class="mf-site-header__catalog-label" >{{ translate("tr_ad51225e2ef05117a709b83a87d45440") }}</span>
                      </div>
                      <a class="h-logo mf-site-header__logo" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                          <img src="{{ $template->storage->logo() }}"  alt="{{ $template->settings->project_title }}">
                      </a>
                      <nav class="mf-site-header__extras" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" >
                         {{ $template->component->translate->outChangeLanguages(["align-vertical"=>"top", "align-horizontal"=>"left", "container-class"=>"mf-site-header__extras-item mf-site-header__extras-lang"]) }}

                         <a href="{{ outLink() }}" class="mf-site-header__extras-link mf-site-header__omit" >{{ translate("tr_047f5653b183292396e67f14c8750b73") }}</a>
                         <a href="{{ outRoute('blog') }}" class="mf-site-header__extras-link mf-site-header__omit" >{{ translate("tr_103a554114af7c598a4f835ac463722e") }}</a>
                      </nav>
                </div>

                {% if($template->router->currentRoute->name != "home"): %}
                <div class="mf-site-header__search mf-header-search mf-site-header__search-slot" >
                    <div class="live-search-container mf-global-search-bar mf-header-search__shell" >
                          <form class="live-search-form mf-header-search__form" method="get" action="{{ outRoute('global-search') }}">
                              <button type="submit" class="live-search-form-icon mf-header-search__submit" aria-label="{{ translate("tr_c4e13f3e179240627dcb0ef7c41ca3d4") }}" ><i class="ti ti-search"></i></button>
                              <input type="text" name="search" class="live-search-form-input mf-header-search__input" autocomplete="off" placeholder="{{ translate("tr_header_global_search_placeholder") }}" value="{{ $_GET['search'] }}" >
                          </form>
                          <div class="live-search-results"></div>
                    </div>
                </div>
                {% endif %}

                <div class="mf-site-header__actions-cluster" >
                <nav class="mf-site-header__actions" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" >
                   <div class="mf-site-header__user mf-site-header__nav" >
                    {% if($template->user->isAuth()): %}
                    <a href="{{ outRoute('profile-orders') }}" class="mf-site-header__nav-text" title="{{ translate("tr_4afd2ca38e5bba8fb023f3bce3e22838") }}" >{{ translate("tr_9a3dc867f2fd583f53c561442ecf34b0") }}</a>

                    {% if($template->router->currentRoute->name == "profile-chat"): %}
                    <a class="mf-site-header__nav-text" href="{{ outRoute('profile-chat') }}" ><span class="mf-site-header__nav-chats-label">{{ translate("tr_header_nav_chats") }}<span class="label-circle-count chat-icon-counter labelChatCountMessages mf-site-header__nav-chats-badge" ></span></span></a>
                    {% else: %}
                    <span class="actionOpenModalChat mf-site-header__nav-text mf-site-header__nav-text--btn" tabindex="0" role="button" ><span class="mf-site-header__nav-chats-label">{{ translate("tr_header_nav_chats") }}<span class="label-circle-count chat-icon-counter labelChatCountMessages mf-site-header__nav-chats-badge" ></span></span></span>
                    {% endif %}

                    <div class="header-wow-top-list-profile mf-site-header__profile-wrap" >
                        {% component profile/menu/header-menu.tpl %}
                    </div>
                    {% else: %}
                    <div class="mf-site-header__auth ds-cluster-16" >
                    {% if($template->router->currentRoute->name == "login"): %}
                    <a class="mf-site-header__text-link" href="{{ outRoute('login') }}" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</a>
                    {% else: %}
                    <button type="button" class="mf-site-header__text-link mf-site-header__text-link--btn actionOpenStaticModal" data-modal-target="auth" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</button>
                    {% endif %}
                    <a class="mf-site-header__text-link" href="{{ outRoute('login') }}" >{{ translate("tr_0b93f81293f084dbfa4dbe93a8280555") }}</a>
                    </div>
                    {% endif %}
                   </div>

                   <span class="mf-site-header__divider" aria-hidden="true"></span>

                   <div class="mf-site-header__add toolbar-link header-add-ad-dropdown" >
                        <span class="header-wow-sticky-add mf-btn mf-btn-sm mf-btn-primary mf-site-header__add-trigger" > <i class="ti ti-plus me-1"></i> {{ translate("tr_6a597fed338ace644982313b3cfbead4") }}</span>
                        <div class="header-add-ad-dropdown-box" >
                            <a href="{{ outRoute('ad-create') }}" class="header-add-ad-dropdown-item" ><i class="ti ti-shopping-cart"></i> {{ translate("tr_header_add_type_sale") }}</a>
                            <a href="{{ outRoute('ad-search-create') }}" class="header-add-ad-dropdown-item" ><i class="ti ti-search"></i> {{ translate("tr_header_add_type_search") }}</a>
                        </div>
                   </div>
                </nav>
                </div>
            </div>
        </div>
        </div>

           <div class="big-catalog-menu-container" >
                <div class="big-catalog-menu-content" >

                    <div class="row" >

                        <div class="col-md-3" >
                            <div class="big-catalog-menu-content-categories" >
                             {{ $template->component->ads_categories->outMainCategoriesByCatalog() }}
                            </div>
                        </div>

                        <div class="col-md-6" >
                             {{ $template->component->ads_categories->outSubCategoriesByCatalog() }}
                        </div>

                        <div class="col-md-3" >

                        </div>

                    </div>

                </div>
           </div>

       </div>
   </div>

   {% else: %}

   <div class="mf-site-header mf-site-header--minimal" >
        <div class="container-fluid mf-site-header__container" >
           <div class="mf-site-header__inner mf-site-header__inner--minimal" >
               <div class="mf-site-header__brand mf-site-header__brand--minimal" >
                  <a class="h-logo mf-site-header__logo" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                      <img src="{{ $template->storage->logo() }}"  alt="{{ $template->settings->project_title }}">
                  </a>
                  <nav class="mf-site-header__extras" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" >
                    {{ $template->component->translate->outChangeLanguages(["align-vertical"=>"top", "align-horizontal"=>"left", "container-class"=>"mf-site-header__extras-item mf-site-header__extras-lang"]) }}
                    <a href="{{ outLink() }}" class="mf-site-header__extras-link mf-site-header__omit" >{{ translate("tr_047f5653b183292396e67f14c8750b73") }}</a>
                    <a href="{{ outRoute('blog') }}" class="mf-site-header__extras-link mf-site-header__omit" >{{ translate("tr_103a554114af7c598a4f835ac463722e") }}</a>
                  </nav>
               </div>
               <div class="mf-site-header__actions mf-site-header__actions--minimal" >
                  <div class="mf-site-header__user mf-site-header__nav" >
                    {% if($template->user->isAuth()): %}
                    <a href="{{ outRoute('profile-orders') }}" class="mf-site-header__nav-text" title="{{ translate("tr_4afd2ca38e5bba8fb023f3bce3e22838") }}" >{{ translate("tr_9a3dc867f2fd583f53c561442ecf34b0") }}</a>
                    {% if($template->router->currentRoute->name == "profile-chat"): %}
                    <a class="mf-site-header__nav-text" href="{{ outRoute('profile-chat') }}" ><span class="mf-site-header__nav-chats-label">{{ translate("tr_header_nav_chats") }}<span class="label-circle-count chat-icon-counter labelChatCountMessages mf-site-header__nav-chats-badge" ></span></span></a>
                    {% else: %}
                    <span class="actionOpenModalChat mf-site-header__nav-text mf-site-header__nav-text--btn" tabindex="0" role="button" ><span class="mf-site-header__nav-chats-label">{{ translate("tr_header_nav_chats") }}<span class="label-circle-count chat-icon-counter labelChatCountMessages mf-site-header__nav-chats-badge" ></span></span></span>
                    {% endif %}
                    <div class="header-wow-top-list-profile mf-site-header__profile-wrap" >
                        {% component profile/menu/header-menu.tpl %}
                    </div>
                    {% else: %}
                    <div class="mf-site-header__auth ds-cluster-16" >
                    {% if($template->router->currentRoute->name == "login"): %}
                    <a class="mf-site-header__text-link" href="{{ outRoute('login') }}" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</a>
                    {% else: %}
                    <button type="button" class="mf-site-header__text-link mf-site-header__text-link--btn actionOpenStaticModal" data-modal-target="auth" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</button>
                    {% endif %}
                    <a class="mf-site-header__text-link" href="{{ outRoute('login') }}" >{{ translate("tr_0b93f81293f084dbfa4dbe93a8280555") }}</a>
                    </div>
                    {% endif %}
                  </div>
               </div>
           </div>
        </div>
   </div>

   {% endif %}

</div>
</header>

<header class="d-block d-lg-none header-visible-height mf-mobile-header" >
<div class="header-wow" >

   <div class="header-wow-top mf-mobile-header__bar{% if($template->router->currentRoute->name != "home" && !empty($_GET["search"])): %} is-search-open{% endif %}" >
        <div class="container" >
            <div class="row align-items-center g-2 mf-mobile-header__bar-row{% if($template->router->currentRoute->name == "home"): %} justify-content-between{% endif %}" >
                <div class="col-auto mf-mobile-header__brand" >
                  {% if($template->router->currentRoute->name == "home"): %}
                  <a class="h-logo mf-mobile-header__brand-link mf-mobile-header__brand-link--full" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                      <img src="{{ $template->storage->logo() }}"  alt="{{ $template->settings->project_title }}">
                  </a>
                  {% else: %}
                  <a class="h-logo-mobile mf-mobile-header__brand-link" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                      <img src="{{ $template->storage->logoMini() }}"  alt="{{ $template->settings->project_title }}">
                  </a>
                  {% endif %}
                </div>

                {% if($template->router->currentRoute->name != "home"): %}
                <div class="col mf-mobile-header__search-col min-w-0" >
                    <div class="live-search-container mf-global-search-bar mf-mobile-header__search-wrap" >
                        {% if($template->router->currentRoute->name != "shop-catalog" && $template->router->currentRoute->name != "shop" && $template->router->currentRoute->name != "shop-page"): %}
                        <form class="live-search-form mf-mobile-header__search-form" method="get" action="{{ outRoute('global-search') }}" role="search" >
                        {% else: %}
                        <form class="live-shop-search-form mf-mobile-header__search-form" method="get" action="{{ $template->component->shop->linkToCatalog($data->shop->alias) }}" role="search" >
                        {% endif %}
                            <div class="mf-mobile-header__search-controls" >
                                <button type="button" class="mf-mobile-header__search-toggle mf-mobile-header__icon" aria-expanded="{% if(!empty($_GET['search'])): %}true{% else: %}false{% endif %}" aria-label="{{ translate("tr_c4e13f3e179240627dcb0ef7c41ca3d4") }}" ><i class="ti ti-search" aria-hidden="true"></i></button>
                                <div class="mf-mobile-header__search-expandable" >
                                    <input type="search" name="search" class="live-search-form-input mf-mobile-header__search-input" autocomplete="off" placeholder="{% if($template->router->currentRoute->name != "shop-catalog" && $template->router->currentRoute->name != "shop" && $template->router->currentRoute->name != "shop-page"): %}{{ translate("tr_header_global_search_placeholder") }}{% else: %}{{ translate("tr_5466fabe16a5487db24c8e71e50cf160") }}{% endif %}" value="{{ $_GET['search'] }}" >
                                    <button type="button" class="mf-mobile-header__search-close mf-mobile-header__icon" aria-label="{{ translate("tr_dd9463bd5d0c650b468fc5d6cfa1073c") }}" ><i class="ti ti-x" aria-hidden="true"></i></button>
                                </div>
                            </div>
                        </form>
                        <div class="live-search-results mf-mobile-header__search-results" ></div>
                    </div>
                </div>
                {% endif %}

                <div class="col-auto text-end mf-mobile-header__actions" >
                  <div class="header-wow-top-list-icon mf-mobile-header__actions-list" >

                    {% if($template->router->currentRoute->name == "catalog" || $template->router->currentRoute->name == "ads-search-catalog"): %}
                    <span class="header-flex-box-icon open-menu-filters-mobile mf-mobile-header__icon" role="button" tabindex="0" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" ><i class="ti ti-adjustments-horizontal" aria-hidden="true"></i> {% if(!empty($_GET["filter"])): %} <span class="badge badge-dot bg-danger badge-notifications"></span> {% endif %}</span>
                    {% endif %}

                    {% if($template->router->currentRoute->name == "shop-catalog"): %}
                    <span class="header-flex-box-icon open-menu-filters-mobile mf-mobile-header__icon" role="button" tabindex="0" ><i class="ti ti-adjustments-horizontal" aria-hidden="true"></i> {% if($_GET["filter"]): %} <span class="badge badge-dot bg-danger badge-notifications"></span> {% endif %}</span>
                    {% endif %}

                    {% if($template->user->isAuth()): %}
                    <div class="mf-mobile-header__user mf-mobile-header__user-row" >
                        {% component profile/menu/mobile-header-profile.tpl %}
                        <span class="header-flex-box-icon open-header-menu-mobile-catalog mf-mobile-header__icon mf-mobile-header__catalog-burger" role="button" tabindex="0" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" ><i class="ti ti-menu-2" aria-hidden="true"></i></span>
                    </div>
                    {% else: %}
                    <span class="header-flex-box-icon open-header-menu-mobile-catalog mf-mobile-header__icon mf-mobile-header__catalog-burger" role="button" tabindex="0" aria-label="{{ translate("tr_ceac57c52ec2d76a3ccdc3df4dfdab6f") }}" ><i class="ti ti-menu-2" aria-hidden="true"></i></span>
                    {% if($template->router->currentRoute->name == "login"): %}
                    <a class="header-wow-top-list-icon-item header-wow-top-auth-icon mf-mobile-header__icon" href="{{ outRoute('login') }}" title='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' aria-label='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' ><i class="ti ti-login"></i></a>
                    {% else: %}
                    <span class="header-wow-top-list-icon-item header-wow-top-auth-icon actionOpenStaticModal mf-mobile-header__icon" data-modal-target="auth" role="button" tabindex="0" title='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' aria-label='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' ><i class="ti ti-login"></i></span>
                    {% endif %}
                    {% endif %}

                  </div>
                </div>
            </div>
        </div>
   </div>


</div>
</header>

<div class="big-catalog-menu-mobile-container mf-mobile-menu" >
    <div class="big-catalog-menu-mobile-content mf-mobile-menu__body" >

        <div class="mobile-catalog-menu-toolbar mf-mobile-menu__header" >
            <span class="btn-custom-mini button-color-scheme2 close-header-menu-mobile" >{{ translate("tr_2b0b0225a86bb67048840d3da9b899bc") }}</span>
            <a href="{{ outLink() }}" class="btn-custom-mini button-color-scheme1 close-header-menu-mobile text-decoration-none" >{{ translate("tr_mobile_catalog_menu_to_home") }}</a>
        </div>

        <div class="mobile-menu-list-link mf-mobile-menu__section" >
            
            <div class="mobile-menu-list-link-item" >{{ $template->component->translate->outChangeLanguages(["align-vertical"=>"top", "align-horizontal"=>"left"]) }}</div>

            {% if($template->router->currentRoute->name == "shop-catalog" || $template->router->currentRoute->name == "shop" || $template->router->currentRoute->name == "shop-page"): %}

            {% if($template->component->shop->countPages($data->shop->id)): %}
            <h5 class="mt20 mb20" > <strong>{{ translate("tr_3a70ca7b21d7f395aace23ce49218819") }}</strong> </h5>
            {{ $template->component->shop->outPages($data) }}
            {% endif %}

            {% endif %}

        </div>

        {% if($template->router->currentRoute->name != "shop-catalog" && $template->router->currentRoute->name != "shop" && $template->router->currentRoute->name != "shop-page"): %}
                <h5 class="mt30 mb10" > <strong>{{ translate("tr_6926e02be4135897ae84b36941554684") }}</strong> </h5>

          <div class="mobile-menu-categories mf-mobile-menu__section" >
            {{ $template->component->ads_categories->outMainCategoriesMobileList() }}
        </div>
        {% endif %}
        <div class="mobile-menu-footer-links mf-mobile-menu__actions" >
            <a href="{{ outLink('rules') }}" class="mobile-menu-footer-link mf-mobile-menu__item" >{{ translate("tr_65053ca2a9f911a081ff806e7ebd9699") }}</a>
            <a href="{{ outLink('privacy-policy') }}" class="mobile-menu-footer-link mf-mobile-menu__item" >{{ translate("tr_5513903457691ab06b8c78a293889379") }}</a>
            <a href="{{ outLink('about') }}" class="mobile-menu-footer-link mf-mobile-menu__item" >{{ translate("tr_4d4b965543303cec8425b75a4a839242") }}</a>
            <a href="{{ outLink('support') }}" class="mobile-menu-footer-link mf-mobile-menu__item" >{{ translate("tr_64425f291098b47b020295a65b376177") }}</a>
        </div>

    </div>
</div>

<div class="header-menu-filters-mobile-container" >
    <div class="header-menu-filters-mobile-content" >

          <span class="btn-custom-mini button-color-scheme2 mb15 close-menu-filters-mobile" >{{ translate("tr_2b0b0225a86bb67048840d3da9b899bc") }}</span>

          {% if($template->router->currentRoute->name == "ads-search-catalog"): %}

          <form class="params-form ad-search-live-filters-mobile params-form-sticky mf-form ds-stack-16" method="get" action="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}" >
              {{ $template->component->ads->outAdsSearchCatalogSidebar($_GET); }}
              <div class="params-buttons-sticky" >
                <button type="submit" class="btn-custom mf-btn mf-btn-md mf-btn-primary width100" >{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>
                {% if(!empty($_GET["filter"])): %}
                <a class="btn-custom mf-btn mf-btn-md mf-btn-dark width100 d-inline-block text-center" href="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}" >{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</a>
                {% endif %}
              </div>
          </form>

          {% elseif($template->router->currentRoute->name == "catalog" || $template->router->currentRoute->name == "shop-catalog"): %}

          <form class="params-form live-filters-mobile params-form-sticky mf-form ds-stack-16" >
              {{ $template->component->catalog->buildParamsForm($_GET, (isset($data->category) && $data->category) ? $data->category->id : 0, false); }}

              <div class="params-buttons-sticky" >
                
                <button class="btn-custom mf-btn mf-btn-md mf-btn-primary width100 actionApplyLiveFiltersMobile" >{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>

                {% if($_GET["filter"]): %}
                <button class="btn-custom mf-btn mf-btn-md mf-btn-dark width100 actionClearLiveFilters">{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</button>
                {% endif %}

              </div>
          </form>

          {% endif %}

    </div>
</div>