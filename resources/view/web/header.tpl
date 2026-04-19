<header {% if($template->view->visible_header): %} class="header-visible-height d-none d-lg-block" {% else: %} class="header-hidden-height d-none d-lg-block" {% endif %} >
<div class="header-wow" >
   
   <div class="header-wow-top" >
        <div class="container" >
           <div class="row" >
               <div class="col-lg-2">

                  <a class="h-logo" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                      <img src="{{ $template->storage->logo() }}"  alt="{{ $template->settings->project_title }}">
                  </a>

               </div>
               <div class="col-lg-7">

                  <div class="header-wow-top-list" >

                    {{ $template->component->translate->outChangeLanguages(["align-vertical"=>"top", "align-horizontal"=>"left", "container-class"=>"header-wow-top-list-item"]) }}

                    <a href="{{ outLink() }}" class="header-wow-top-list-item" >{{ translate("tr_047f5653b183292396e67f14c8750b73") }}</a>
                    <!-- <a href="{{ outRoute('shops') }}" class="header-wow-top-list-item" >{{ translate("tr_cfb8af01cc910b08e8796e03cf662f5f") }}</a> -->
                    <!-- <a href="{{ outLink('business-tariffs') }}" class="header-wow-top-list-item" >{{ translate("tr_0c301c86194643f93cb5e144e36698bf") }}</a> -->
                    <!-- <a href="{{ outLink('secure-deals') }}" class="header-wow-top-list-item" >{{ translate("tr_1eb027fdbd155cb5c39d813737a8318f") }}</a> -->
                    <a href="{{ outRoute('blog') }}" class="header-wow-top-list-item" >{{ translate("tr_103a554114af7c598a4f835ac463722e") }}</a>

                  </div>

               </div>
               <div class="col-lg-3 text-end" >

                  <div class="header-wow-top-list-icon" >

                    {% if($template->user->isAuth()): %}
                    {% if($template->router->currentRoute->name == "profile-chat"): %}
                    <a class="header-wow-top-list-icon-item" href="{{ outRoute('profile-chat') }}" ><i class="ti ti-messages"></i> <span class="label-circle-count chat-icon-counter labelChatCountMessages" ></span> </a>
                    {% else: %}
                    <span class="actionOpenModalChat header-wow-top-list-icon-item" ><i class="ti ti-messages"></i> <span class="label-circle-count chat-icon-counter labelChatCountMessages" ></span> </span>
                    {% endif %}
                    {% endif %}

                    {% if($template->settings->basket_status): %}
                    <a href="{{ outRoute('cart') }}" class="header-wow-top-list-icon-item" ><i class="ti ti-shopping-bag"></i> <span class="label-circle-count cart-icon-counter labelCartCountItems" ></span> </a>
                    {% endif %} 

                    {% if($template->user->isAuth()): %}
                    <a href="{{ outRoute('profile-favorites') }}" class="header-wow-top-list-icon-item" ><i class="ti ti-heart"></i></a>
                    {% endif %} 

                    {% if($template->user->isAuth()): %}
                    <div class="header-wow-top-list-profile">
                        {% component profile/menu/header-menu.tpl %}
                    </div>
                    {% else: %}
                    {% if($template->router->currentRoute->name == "login"): %}
                    <a class="header-wow-top-auth header-wow-sticky-auth button-color-scheme2" href="{{ outRoute('login') }}" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</a>
                    {% else: %}
                    <button type="button" class="header-wow-top-auth header-wow-sticky-auth button-color-scheme2 actionOpenStaticModal" data-modal-target="auth" >{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}</button>
                    {% endif %}
                    {% endif %}                  

                  </div>
                   
               </div>
           </div>
        </div>
   </div>

   {% if($template->view->visible_header): %}

   <div class="header-wow-sticky" >
       
       <div class="header-wow-sticky-container" >

        <div class="container" >
         
           <div class="row" >

               <div class="col-12" >
                   
                <div class="header-flex-box" >

                   <div class="header-flex-box-1" >

                      <div class="header-button-menu-catalog open-header-menu-catalog button-color-scheme1" >
                          <span class="header-button-menu-catalog-icon-1" > <i class="ti ti-category"></i> </span>
                          <span>{{ translate("tr_ad51225e2ef05117a709b83a87d45440") }}</span>
                      </div>
  
                   </div>
                   
                   <div class="header-flex-box-2" >

                      <div class="live-search-container" >
                          
                            <form class="live-search-form" method="get" action="{{ $template->component->catalog->currentAliases() }}">
                                <button class="live-search-form-icon"><i class="ti ti-search"></i></button>
                                <input type="text" name="search" class="live-search-form-input" autocomplete="off" placeholder="{{ translate("tr_c4e13f3e179240627dcb0ef7c41ca3d4") }}" value="{{ $_GET['search'] }}"> 
                            </form>

                            <div class="live-search-results"></div>
                          
                      </div>

                   </div>

                   <div class="header-flex-box-3" >
                        
                        <div class="toolbar-link header-add-ad-dropdown" >
                            <span class="header-wow-sticky-add button-color-scheme1" > {{ translate("tr_6a597fed338ace644982313b3cfbead4") }} <i class="ti ti-chevron-down ms-1"></i></span>
                            <div class="header-add-ad-dropdown-box" >
                                <a href="{{ outRoute('ad-create') }}" class="header-add-ad-dropdown-item" ><i class="ti ti-shopping-cart"></i> {{ translate("tr_header_add_type_sale") }}</a>
                                <a href="{{ outRoute('ad-search-create') }}" class="header-add-ad-dropdown-item" ><i class="ti ti-search"></i> {{ translate("tr_header_add_type_search") }}</a>
                            </div>
                        </div>

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

   </div>

   {% endif %}

</div>
</header>

<header class="d-block d-lg-none header-visible-height" >
<div class="header-wow" >

   <div class="header-wow-top" >
        <div class="container" >
            <div class="row" >
                <div class="col-4" >
                  <a class="h-logo-mobile" href="{{ outLink(); }}" title="{{ $template->settings->project_title }}" >
                      <img src="{{ $template->storage->logoMini() }}"  alt="{{ $template->settings->project_title }}">
                  </a>                    
                </div>
                <div class="col-8 text-end" >
                    
                  <div class="header-wow-top-list-icon" >

                    <a class="header-wow-top-list-icon-item" href="{{ outRoute('ad-create') }}"><i class="ti ti-plus"></i></a>

                    {% if($template->user->isAuth()): %}
                    {% if($template->router->currentRoute->name == "profile-chat"): %}
                    <a class="header-wow-top-list-icon-item" href="{{ outRoute('profile-chat') }}" ><i class="ti ti-messages"></i> <span class="label-circle-count chat-icon-counter labelChatCountMessages" ></span> </a>
                    {% else: %}
                    <span class="actionOpenModalChat header-wow-top-list-icon-item" ><i class="ti ti-messages"></i> <span class="label-circle-count chat-icon-counter labelChatCountMessages" ></span> </span>
                    {% endif %}
                    {% endif %}

                    {% if($template->settings->basket_status): %}
                    <a href="{{ outRoute('cart') }}" class="header-wow-top-list-icon-item" ><i class="ti ti-shopping-bag"></i> <span class="label-circle-count cart-icon-counter labelCartCountItems" ></span> </a>
                    {% endif %} 

                    {% if($template->user->isAuth()): %}
                    <a href="{{ outRoute('profile-favorites') }}" class="header-wow-top-list-icon-item" ><i class="ti ti-heart"></i></a>
                    {% endif %} 

                    {% if($template->user->isAuth()): %}
                    <div class="header-wow-top-list-profile">
                        {% component profile/menu/header-menu.tpl %}
                    </div>
                    {% else: %}
                    {% if($template->router->currentRoute->name == "login"): %}
                    <a class="header-wow-top-list-icon-item header-wow-top-auth-icon" href="{{ outRoute('login') }}" title='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' aria-label='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' ><i class="ti ti-login"></i></a>
                    {% else: %}
                    <span class="header-wow-top-list-icon-item header-wow-top-auth-icon actionOpenStaticModal" data-modal-target="auth" role="button" tabindex="0" title='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' aria-label='{{ translate("tr_63a753751e8899416d62b1d1bbb61720") }}' ><i class="ti ti-login"></i></span>
                    {% endif %}
                    {% endif %}                    

                  </div>

                </div>
            </div>
        </div>
   </div>

   <div class="header-wow-sticky" >
       
       <div class="header-wow-sticky-container" >

        <div class="container" >

            {% if($template->router->currentRoute->name != "shop-catalog" && $template->router->currentRoute->name != "shop" && $template->router->currentRoute->name != "shop-page"): %}
         
                <div class="header-flex-box" >

                   <div class="header-flex-box-1" >

                      <span class="header-flex-box-icon open-header-menu-mobile-catalog" ><i class="ti ti-menu-2"></i></span>
  
                   </div>
                   
                   <div class="header-flex-box-2" >

                      <div class="live-search-container" >
                          
                            <form class="live-search-form" method="get" action="{{ $template->component->catalog->currentAliases() }}">
                                <button class="live-search-form-icon"><i class="ti ti-search"></i></button>
                                <input type="text" name="search" class="live-search-form-input" autocomplete="off" placeholder="{{ translate("tr_c4e13f3e179240627dcb0ef7c41ca3d4") }}" value="{{ $_GET['search'] }}"> 
                            </form>

                            <div class="live-search-results"></div>
                          
                      </div>

                   </div>

                   {% if($template->router->currentRoute->name == "catalog" || $template->router->currentRoute->name == "ads-search-catalog"): %}
                   <div class="header-flex-box-3" >
                      <span class="header-flex-box-icon open-menu-filters-mobile" ><i class="ti ti-adjustments-horizontal"></i> {% if(!empty($_GET["filter"])): %} <span class="badge badge-dot bg-danger badge-notifications"></span> {% endif %}</span>
                   </div>
                   {% endif %}

                </div>

            {% else: %}

                <div class="header-flex-box" >

                   <div class="header-flex-box-1" >

                      <span class="header-flex-box-icon open-header-menu-mobile-catalog" ><i class="ti ti-menu-2"></i></span>
  
                   </div>
                   
                   <div class="header-flex-box-2" >

                      <div class="live-search-container" >
                          
                            <form class="live-shop-search-form" method="get" action="{{ $template->component->shop->linkToCatalog($data->shop->alias) }}">
                                <button class="live-search-form-icon"><i class="ti ti-search"></i></button>
                                <input type="text" name="search" class="live-search-form-input" autocomplete="off" placeholder="{{ translate("tr_5466fabe16a5487db24c8e71e50cf160") }}" value="{{ $_GET['search'] }}"> 
                            </form>

                      </div>

                   </div>

                   {% if($template->router->currentRoute->name == "shop-catalog"): %}
                   <div class="header-flex-box-3" >

                      <span class="header-flex-box-icon open-menu-filters-mobile" ><i class="ti ti-adjustments-horizontal"></i> {% if($_GET["filter"]): %} <span class="badge badge-dot bg-danger badge-notifications"></span> {% endif %} </span>

                   </div>
                   {% endif %}

                </div>

            {% endif %}

       </div>

       </div>

   </div>

</div>
</header>

<div class="big-catalog-menu-mobile-container" >
    <div class="big-catalog-menu-mobile-content" >

        <div class="mobile-catalog-menu-toolbar" >
            <span class="btn-custom-mini button-color-scheme2 close-header-menu-mobile" >{{ translate("tr_2b0b0225a86bb67048840d3da9b899bc") }}</span>
            <a href="{{ outLink() }}" class="btn-custom-mini button-color-scheme1 close-header-menu-mobile text-decoration-none" >{{ translate("tr_mobile_catalog_menu_to_home") }}</a>
        </div>

        <div class="mobile-menu-list-link" >
            
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

          <div class="mobile-menu-categories" >
            {{ $template->component->ads_categories->outMainCategoriesMobileList() }}
        </div>
        {% endif %}
        <div class="mobile-menu-footer-links" >
            <a href="{{ outLink('rules') }}" class="mobile-menu-footer-link" >{{ translate("tr_65053ca2a9f911a081ff806e7ebd9699") }}</a>
            <a href="{{ outLink('privacy-policy') }}" class="mobile-menu-footer-link" >{{ translate("tr_5513903457691ab06b8c78a293889379") }}</a>
            <a href="{{ outLink('about') }}" class="mobile-menu-footer-link" >{{ translate("tr_4d4b965543303cec8425b75a4a839242") }}</a>
            <a href="{{ outLink('support') }}" class="mobile-menu-footer-link" >{{ translate("tr_64425f291098b47b020295a65b376177") }}</a>
        </div>

    </div>
</div>

<div class="header-menu-filters-mobile-container" >
    <div class="header-menu-filters-mobile-content" >

          <span class="btn-custom-mini button-color-scheme2 mb15 close-menu-filters-mobile" >{{ translate("tr_2b0b0225a86bb67048840d3da9b899bc") }}</span>

          {% if($template->router->currentRoute->name == "ads-search-catalog"): %}

          <form class="params-form ad-search-live-filters-mobile params-form-sticky" method="get" action="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}" >
              {{ $template->component->ads->outAdsSearchCatalogSidebar($_GET); }}
              <div class="params-buttons-sticky" >
                <button type="submit" class="btn-custom button-color-scheme1 width100" >{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>
                {% if(!empty($_GET["filter"])): %}
                <a class="btn-custom button-color-scheme3 width100 mt5 d-inline-block text-center" href="{{ $template->component->ads->outHrefAdsSearchCatalog(); }}" >{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</a>
                {% endif %}
              </div>
          </form>

          {% elseif($template->router->currentRoute->name == "catalog" || $template->router->currentRoute->name == "shop-catalog"): %}

          <form class="params-form live-filters-mobile params-form-sticky" >
              {{ $template->component->catalog->buildParamsForm($_GET, (isset($data->category) && $data->category) ? $data->category->id : 0, false); }}

              <div class="params-buttons-sticky" >
                
                <button class="btn-custom button-color-scheme1 width100 actionApplyLiveFiltersMobile" >{{ translate("tr_130bbbc068f7a58df5d47f6587ff4b43") }}</button>

                {% if($_GET["filter"]): %}
                <button class="btn-custom button-color-scheme3 width100 mt5 actionClearLiveFilters">{{ translate("tr_02d901c131a1b8c2d1dd669e1f6c88a5") }}</button>
                {% endif %}

              </div>
          </form>

          {% endif %}

    </div>
</div>